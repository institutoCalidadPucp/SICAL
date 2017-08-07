class ContactUsMailer < ActionMailer::Base
	default from: "quality.institute.pucp@gmail.com"

	def contact_email contact
		@user = contact.laboratory.email
		@subject = contact.subject
		mail(to:  @user, subject: @subject)
	end
end
