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

  def init params, processed_hash
		self.sample_category_id = params["sample_category_id"]
		self.description = params["description"]
		self.pucp_code = params["pucp_code"]
		self.client_code = params["client_code"]
		#to extract
		#YAML.load(yaml)
		self.classified_values = processed_hash.to_yaml
		self.save
  end
end
