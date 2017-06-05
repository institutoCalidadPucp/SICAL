class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, required: false

  enum category: [:employee, :client]
  enum gender: [:male, :female]
  enum status: [:active, :inactive]

  def set_password
    self.password = "pucppass2017"
    self
  end

  def permit_tabs
    if self.category?
      self.client? ? MenuPermit.client_tabs :  ( self.role.present? ? self.role.menus : [] )
    else
      MenuPermit.limit(13)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      begin
        where(conditions).first.active?
      rescue
        false
      end
    end
  end
end
