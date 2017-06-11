class Inventory < ApplicationRecord
  include ApplicationHelper
	
  validates :code, presence: true
  validates :description, presence: true

  belongs_to :laboratory, required: true
  
  enum status: [:active, :inactive]
  
end
