class ContactUsController < ApplicationController
	before_action :set_laboratories, only: [:new, :create]

	def new
		@contact_us = ContactU.new
	end

	def create
		@contact_us = ContactU.new contact_us_params
		if @contact_us.save
			ContactUsMailer.contact_email(@contact_us).deliver_now
      redirect_to new_contact_u_path
		end
	end

	private

    def contact_us_params
      params.require(:contact_u).permit(:subject, :message, :laboratory_id)
    end	

    def set_laboratories
    	@laboratories = Laboratory.all
    end
end
