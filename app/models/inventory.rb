class Inventory < ApplicationRecord
  include ApplicationHelper
	
  validates :code, presence: true
  validates :description, presence: true
  
  enum status: [:active, :inactive]
  
end
