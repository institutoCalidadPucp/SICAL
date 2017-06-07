class Laboratory < ApplicationRecord
  include ApplicationHelper
	
  validates :name, presence: true
  validates :phone, length: { in: 7..9}
  validates :phone, numericality: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  has_many :sample_methods

  enum status: [:active, :inactive]
end
