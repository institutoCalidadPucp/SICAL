class Service < ApplicationRecord
  #validates :subject, presence: true
  #validates :pick_up_date, presence: true

  belongs_to :client, required: false, class_name: "User"
  belongs_to :employee, required: false, class_name: "User"
  belongs_to :laboratory, required: false

  has_many :sample_preliminaries
  has_many :sample_processeds

  accepts_nested_attributes_for :sample_preliminaries, allow_destroy: true
  accepts_nested_attributes_for :sample_processeds, allow_destroy: true

  scope :services_per_client, -> (current_user) {where(client_id: current_user)}
  scope :services_per_worker, -> (current_user) {where(employee_id: current_user)}
  scope :service_per_supervisor, -> (current_user) {where(supervisor_id: current_user.id)}
  scope :own_per_laboratory, -> (current_user) {where(laboratory_id: current_user.laboratory)}


  enum work_flow: [:initialized, :initial_funded, :initial_accepted, :initial_rejected, :assign_sorter, :classified, :classified_to_rework, :accepted_classified, :accepted_adjust, :accepted_contract, :contract_rejected, :engaged, :completed,:final_completed]
  enum intern_flow: [:internal_accepted, :internal_rejected]
  enum status: [:active, :inactive]
  mount_uploader :final_report, DocumentUploader

  before_save :generate_contract_doc, if: :accepted_contract?

  def self.own_per_user current_user
    #client gets his services or lab leader gets his services
    current_user.client? ? services_per_client(current_user) : own_per_laboratory(current_user)
  end

  def self.quotations_without_funded current_user
    #lab leader gets the services beginning per a client that belongs to his laboratory
    own_per_user(current_user).initialized
  end

  def self.quotations_with_initial_funded current_user
    #client gets the initial services that some lab leader funded
    services_per_client(current_user).initial_funded
  end

  def self.inital_funded_accepted current_user
    #lab leader gets the services that a client accept to be begin
    own_per_laboratory(current_user).initial_accepted
  end

  def self.unclassified_to_work current_user
    #worker gets his pending works to classified
    services_per_worker(current_user).assign_sorter
  end

  def self.classified_to_check current_user
    # Get the services that this supervisor assigned
    service_per_supervisor(current_user).classified
  end

  def self.service_classified_to_rework current_user
    own_per_laboratory(current_user).classified_to_rework.where(:employee_id => current_user.id)
  end

  def self.passed_classification current_user
    #
    own_per_laboratory(current_user).accepted_classified
  end

  def self.adjusted_by_lab_leader current_user
    services_per_client(current_user).accepted_adjust
  end

  def self.contract_bound current_user
    service_per_supervisor(current_user).accepted_contract
  end

  def self.services_with_engagements current_user
    service_per_supervisor(current_user).engaged
  end

  def self.services_completed current_user
    own_per_laboratory(current_user).completed
  end

  def self.services_final_completed current_user
    own_per_client(current_user).final_completed
  end

  def can_see_quotation_adjust
    self.accepted_classified? or self.accepted_adjust? or self.accepted_contract?
  end


  def handling_client_process current_user
    #client create a service
    if self.initialized?
      (self.client = current_user) 
      self.save
    end

    if !self.engagement and self.accepted_adjust?
      self.contract_rejected! 
    else 
      self.accepted_contract! if self.accepted_adjust? and self.engagement
    end
    #    
    #client accept the initial funded to his services
    if !self.valid_initial_funded and self.initial_funded?
      self.initial_rejected! 
    else
      self.initial_accepted! if self.initial_funded? and self.valid_initial_funded
    end
  end
  
  def handling_internal_process current_user
    #
    self.final_completed! if self.completed?
    
    self.completed! if self.engaged?

    self.engaged! if self.accepted_contract?
    
    #
    self.accepted_adjust! if self.accepted_classified?
    #lab leader check if the classified work from a employee is correct    

    self.accepted_classified! if self.classified? and self.valid_classified      
    
    incredRevision = false
    if self.classified_to_rework?
      incredRevision = true
    end
    self.classified! if self.classified_to_rework?

    self.classified_to_rework! if (self.classified? and !incredRevision) and !self.valid_classified    

    #worker fill the classified fields from a sample
    self.classified! if self.assign_sorter?    
    if self.initial_accepted?
      self.supervisor_id = current_user.id
    end

    #choosing one employee from the current lab to set the classification to the sample
    self.assign_sorter! if self.initial_accepted?

    #Mejorar esto. Cuando se asigna trabajo, el current user se vuelve el supervisador
    if self.initial_accepted?
      #self.supervisor_id = current_user.id
      #Crear esta columna
    end
    #an initial service is funded
    self.initial_funded! if self.initialized?
  end

  def set_work_flow current_user
    current_user.client? ? self.handling_client_process(current_user) : self.handling_internal_process(current_user)
  end

  def asssign_workers service_params, current_user
    self.sample_processeds.each.with_index(1) do |sample_processed, index|
      work_order = WorkOrder.new
      work_order.assign_attr service_params, current_user, sample_processed, index, self
      work_order.subject = self.subject + sample_processed.pucp_code
      work_order.save if work_order.valid?
    end
  end
  def generate_contract_doc
    contract = ContractPdf.new(self)
    contract.page_counter
    contract.render_file File.join(Rails.root, "public/contratos", "ContratoServ-#{self.id}.pdf")
  end
end

