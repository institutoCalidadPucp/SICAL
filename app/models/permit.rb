class Permit < ApplicationRecord
  has_many :menu_permits
  has_many :menus, :through => :menu_permits
end
