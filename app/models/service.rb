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
  scope :own_per_laboratory, -> (current_user) {where(laboratory_id: current_user.laboratory)}

  enum work_flow: [:initialized, :initial_funded, :initial_accepted, :assign_sorter, :classified, :accepted_classified, :accepted_adjust, :engagement]
  enum intern_flow: [:internal_accepted, :internal_rejected]
  enum status: [:active, :inactive]

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

  def self.unclassified_to_check current_user
    #
    own_per_laboratory(current_user).classified
  end

  def self.passed_classification current_user
    #
    own_per_laboratory(current_user).accepted_classified
  end

  def self.adjusted_by_lab_leader current_user
    services_per_client(current_user).accepted_adjust
  end

  def self.services_with_engagements current_user
    own_per_laboratory(current_user).engagement
  end

  def handling_client_process current_user
    #
    self.engagement! if self.accepted_adjust?
    #client accept the initial funded to his services
    self.initial_accepted! if self.initial_funded? and self.valid_initial_funded
    #client create a service
    if self.initialized?
      (self.client = current_user) 
      self.save
    end
  end
  
  def handling_internal_process
    #
    self.accepted_adjust! if self.accepted_classified?
    #lab leader check if the classified work from a employee is correct
    self.accepted_classified! if self.classified? and self.valid_classified
    #worker fill the classified fields from a sample
    self.classified! if self.assign_sorter?
    #choosing one employee from the current lab to set the classification to the sample
    self.assign_sorter! if self.initial_accepted?
    #an initial service is funded
    self.initial_funded! if self.initialized?
  end

  def set_work_flow current_user
    current_user.client? ? self.handling_client_process(current_user) : self.handling_internal_process
  end

end

