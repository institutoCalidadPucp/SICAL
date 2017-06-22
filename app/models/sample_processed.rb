class SampleProcessed < ApplicationRecord

	belongs_to :user, required: false
  belongs_to :service, required: false
  belongs_to :sample_method, required: false
  belongs_to :sample_category, required: false
  has_many :sample_features


  accepts_nested_attributes_for :sample_features, allow_destroy: true

end
