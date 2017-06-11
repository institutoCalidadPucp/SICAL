class User < ApplicationRecord
  include ApplicationHelper


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, required: false
  belongs_to :laboratory, required: false

  enum category: [:employee, :client]
  enum gender: [:male, :female]
  enum status: [:active, :inactive]

  def can_action tab_reference
    permit_tabs.where(tab_reference: tab_reference).first.create_permit
  end

  def can_view tab_reference
    can_action(tab_reference)
  end

  def can_create tab_reference
    can_action(tab_reference)
  end

  def can_edit tab_reference
    can_action(tab_reference)
  end

  def can_delete tab_reference
    can_action(tab_reference)
  end

  def set_password
    self.password = "pucppass2017"
    self
  end

  def permit_tabs
    if self.category?
      self.client? ? MenuPermit.client_tabs : ( self.role.present? ? self.role.menus : [] )
    else
      MenuPermit.order(:order)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      current_user = where(conditions).first
      current_user.active? ? current_user : false
    end
  end

  def set_laboratory current_user
    begin
      if current_user.laboratory.present?
        current_user.laboratory.users << self
      else
        self
      end
    rescue
      false 
    end
  end
end
