class Inventory < ApplicationRecord
  include ApplicationHelper
  
  validates :code, presence: true
  validates :description, presence: true

  belongs_to :laboratory, required: false
  
  enum status: [:active, :inactive]

  def set_laboratory current_user
    begin
      if current_user.laboratory.present?
        current_user.laboratory.inventories << self
      end
    rescue
      false 
    end
  end
  
end