class SampleMethod < ApplicationRecord

	validates :description, presence: true
  validates :unit_cost, numericality: { :greater_than_or_equal_to => 0 }

  belongs_to :laboratory  

  scope :own_per_user, -> (current_user) {where(laboratory_id: current_user.laboratory)}

  enum status: [:active, :inactive]
  enum accreditation: [:accredited, :non_accredited]  
end
