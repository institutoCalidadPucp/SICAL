class MenuPermit < ApplicationRecord
  
  belongs_to :role, required: false

  validates_associated :role

  def self.names
  	MenuPermit.pluck(:name)	
  end

end
