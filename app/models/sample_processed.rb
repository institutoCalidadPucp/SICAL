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

  def init params,sample_preliminary, custody_order       
		self.sample_category_id = sample_preliminary.sample_category_id
    self.sample_method_id = sample_preliminary.sample_method_id
    self.custody_order_id = custody_order.id
    self.amount = sample_preliminary.quantity
		self.description = params["description"]
		self.pucp_code = params["pucp_code"]
		self.client_code = params["client_code"]        		
		self.classified_values = params["sp_value"]
		self.save
  end

  def update params,sample_preliminary, custody_order               
		self.description = params[:sample_processed][:description]	
    p params[:sample_processed][:client_code]	
    p params["sample_processed"]["client_code"]	
		self.client_code = params[:sample_processed][:client_code]        		
    self.pucp_code = params[:sample_processed][:pucp_code]
		self.classified_values = params["sp_value"]
		self.save
  end

  def handle_subtotal
    service = self.service
    sample_position = service.sample_processeds.map(&:id).index(self.id)
    sample_preliminary = service.sample_preliminaries[sample_position]
    sample_preliminary.quantity.to_f * sample_preliminary.unit_cost.to_f
  end
end
