class Inventory < ApplicationRecord
  validates :inventoryCode, presence: true
  validates :description, presence: true
  
  enum :status [:active, :inactive]
  
end
