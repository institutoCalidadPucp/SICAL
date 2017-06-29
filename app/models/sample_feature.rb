class SampleFeature < ApplicationRecord
  belongs_to :sample_processed, required: false
  validates :lower_range, numericality: true
  validates :upper_range, numericality: true

end
