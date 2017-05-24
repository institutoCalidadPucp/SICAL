class Menu < ApplicationRecord
  has_many :menu_permits
  has_many :permits, :through => :menu_permits
end
