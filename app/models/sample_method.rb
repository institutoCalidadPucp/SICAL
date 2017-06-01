class SampleMethod < ApplicationRecord
  validates :description, presence: true
  validates :unitCost, numericality: { :greater_than_or_equal_to => 0 }

  # Relations
  belongs_to :Laboratory  
  enum accreditation: [:accredited, :nonAccredited]  
end
