class SamplePreliminary < ApplicationRecord

  belongs_to :service, required: false
  
  def permited_features
    3
  end
  
end
