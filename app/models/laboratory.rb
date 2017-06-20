class Laboratory < ApplicationRecord
  include ApplicationHelper
	
  validates :name, presence: true
  validates :phone, length: { in: 7..9}
  validates :phone, numericality: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  has_many :sample_methods
  has_many :requests
  has_many :services, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :supplies, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :roles, dependent: :destroy

  enum status: [:active, :inactive]
end
