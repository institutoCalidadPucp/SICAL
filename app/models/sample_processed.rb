class SampleProcessed < ApplicationRecord

  belongs_to :service, required: false
  has_many :sample_features

  accepts_nested_attributes_for :sample_features, allow_destroy: true

end
