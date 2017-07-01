class SystemParameter < ApplicationRecord
  enum feature: [:service, :name_app, :welcome_message, :terms_and_condition, :login_attemps]
  
  def can_show_description
    ["name_app", "welcome_message", "terms_and_condition"].include?(self.feature)
  end

  def can_show_values
    ["service", "login_attemps"].include?(self.feature)
  end

end
