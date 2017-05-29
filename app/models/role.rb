class Role < ApplicationRecord

  validates :name, presence: true

  has_many  :menu_permits, dependent: :destroy
  has_many  :users, dependent: :destroy
  
  accepts_nested_attributes_for :menu_permits, allow_destroy: true

end
