class Inventory < ApplicationRecord
  validates :inventoryCode, presence: true
  validates :description, presence: true
end
