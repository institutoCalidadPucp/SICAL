class Inventory < ApplicationRecord
  include ApplicationHelper
  
  validates :code, presence: true
  validates :description, presence: true

  belongs_to :laboratory, required: false
  
  scope :own_per_user, -> (current_user) {where(laboratory_id: current_user.laboratory)}
  
  enum status: [:active, :inactive]
  
end