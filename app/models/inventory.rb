class Inventory < ApplicationRecord
  include ApplicationHelper
	
  validates :inventoryCode, presence: true
  validates :description, presence: true
  
  enum status: [:active, :inactive]
  
end
