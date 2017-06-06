module ApplicationHelper
	def change_status
    self.active? ? self.inactive! : self.active!
  end
end
