module ApplicationHelper

  def change_status
    self.active? ? self.inactive! : self.active!
  end

  def set_laboratory current_user
  	begin
  		if current_user.laboratory.present?
  			current_user.laboratory.send(self.class.name.pluralize.downcase) << self
  		end
  	rescue Exception => e
  		false
  	end
  end


end
