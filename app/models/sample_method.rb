class SampleMethod < ApplicationRecord
	validates :description, presence: true
  validates :unit_cost, numericality: { :greater_than_or_equal_to => 0 }

  # Relations
  belongs_to :laboratory  
  enum accreditation: [:accredited, :non_accredited]  
end
