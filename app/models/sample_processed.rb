class SampleProcessed < ApplicationRecord

	belongs_to :user, required: false
  belongs_to :service, required: false
  belongs_to :sample_method, required: false
  belongs_to :sample_category, required: false
  belongs_to :custody_order, required: false
  has_many :sample_features


  delegate :name, to: :sample_method, prefix: true, allow_nil: true
  delegate :accredited?, to: :sample_method, prefix: true, allow_nil: true

  accepts_nested_attributes_for :sample_features, allow_destroy: true

end
