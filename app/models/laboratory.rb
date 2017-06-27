class Laboratory < ApplicationRecord
  include ApplicationHelper
	
  validates :name, presence: true
  validates :phone, length: { in: 7..9}
  validates :phone, numericality: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  mount_uploader :header_image, ImageUploader
  mount_uploader :internal_report, DocumentUploader
  mount_uploader :accredited_report, DocumentUploader
  mount_uploader :normal_report, DocumentUploader
  #before_save :update_header_image_attributes

  has_many :sample_methods
  has_many :requests
  has_many :services, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_many :supplies, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :sample_categories, dependent: :destroy

  enum status: [:active, :inactive]

  
end
