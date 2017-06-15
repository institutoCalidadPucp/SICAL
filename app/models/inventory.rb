class Inventory < ApplicationRecord
  include ApplicationHelper
  
  validates :code, presence: true
  validates :description, presence: true

  belongs_to :laboratory, required: false
  
  enum status: [:active, :inactive]
  
  def self.own_per_user current_user
  	if current_user.admin?
  		all
  	else
  		where(laboratory_id: current_user.laboratory)
  	end
  end
end