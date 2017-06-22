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

  scope :work_order_per_user, -> (current_user) {where(employee_id: current_user)}
  scope :own_per_laboratory, -> (current_user) {where(laboratory_id: current_user.laboratory)}

  enum work_flow: [:initialized, :assigned, :classified, :funded, :accepted, :completed]
  enum intern_flow: [:internal_accepted, :internal_rejected]
  enum status: [:active, :inactive]

  def set_work_flow current_user
  	if current_user.client?
      self.client = current_user
  		self.initialized!
      self.accepted! if self.engagement
    else
      self.funded! if (self.classified? and self.internal_accepted?)
      self.internal_accepted! if (self.classified? and self.valid_classified)
      self.internal_rejected! if (self.classified? and !self.valid_classified)
      self.classified! if self.assigned?
      self.assigned! if self.initialized?
    end
  end

  def self.own_per_user current_user
    if current_user.client?
      Service.where(client_id: current_user)
    else
      Service.where(laboratory_id: current_user.laboratory)
    end
  end
end

