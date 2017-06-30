class SamplePreliminary < ApplicationRecord
  
  belongs_to :user, required: false
  belongs_to :service, required: false
  belongs_to :sample_method, required: false
  belongs_to :sample_category, required: false
  
  delegate :name, to: :sample_method, prefix: true, allow_nil: true
  delegate :accredited?, to: :sample_method, prefix: true, allow_nil: true

  
end
