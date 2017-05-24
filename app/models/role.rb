class Role < ApplicationRecord
  has_many :menu_permit_roles
  has_many :menu_permits, :through => :menu_permit_roles
end
