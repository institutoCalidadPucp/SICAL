class User < ApplicationRecord
  include ApplicationHelper

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
       
  belongs_to :role, required: false
  belongs_to :laboratory, required: false
  has_many :client_services, class_name: "Service", foreign_key: 'client_id'
  #has_many :employee_services, class_name: "Service", foreign_key: 'employee_id'
  has_many :sample_processeds


  enum category: [:admin, :employee, :client]
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
    unless self.admin?
      self.client? ? MenuPermit.client_tabs : ( self.role.present? ? self.role.menus : [] )
    else
      MenuPermit.order(:order).where(default: true)
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

  def self.own_per_user current_user
    if current_user.admin?
      all
    else
      where(laboratory_id: current_user.laboratory)
    end
  end

  def omniauth_values auth
    self.email = auth.info.email
    self.password = Devise.friendly_token[0,20]
    self.provider = auth.provider
    self.uid = auth.uid
    self.name = auth.info.name
    self.oauth_token = auth.credentials.token
    self.oauth_expires_at = Time.at(auth.credentials.expires_at)
  end

  def self.from_omniauth(auth)
    user = User.find_by_email auth.info.email
    if user
      if !user.oauth_token
        user.omniauth_values auth
        user.save
      end
      return user
    end
    return nil
  end
end
