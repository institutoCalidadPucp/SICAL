class MenuPermit < ApplicationRecord
  belongs_to :menu
  belongs_to :permit
  has_many :menu_permit_roles
  has_many :roles, :through => :menu_permit_roles
end
