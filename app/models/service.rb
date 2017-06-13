class Service < ApplicationRecord

  #validates :subject, presence: true
  #validates :pick_up_date, presence: true

  belongs_to :user, required: false
  belongs_to :laboratory, required: false

  has_many :sample_preliminaries
  has_many :sample_processeds

  accepts_nested_attributes_for :sample_preliminaries, allow_destroy: true
  accepts_nested_attributes_for :sample_processeds, allow_destroy: true


  scope :own_per_user, -> (current_user) {where(laboratory_id: current_user.laboratory)}

  enum work_flow: [:initialized, :prepared, :funded]
  enum status: [:active, :inactive]

  def set_work_flow current_user
  	if current_user.client?
  		self.initialized!
  	else
  		self.prepared!
  	end
  end

end

