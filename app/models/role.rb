class Role < ApplicationRecord
	validates :name, presence: true
  has_many :menu_permit_roles
  has_many :menu_permits, :through => :menu_permit_roles
end
