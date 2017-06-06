class MenuPermit < ApplicationRecord
  
  belongs_to :role, required: false

  validates_associated :role

  scope :get_default_tab, -> (tab_name) { where.not(tab_reference: nil).where(name: tab_name).first }
  scope :client_tabs, -> () {where(available_for_client: true)}

  def self.names
  	MenuPermit.pluck(:name)	
  end

end
