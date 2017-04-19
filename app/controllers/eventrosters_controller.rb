class EventrostersController < ApplicationController
	def join
		event = Eventroster.create(user: User.find(current_user.id), event: Event.find(params[:id]))
		if event.save
			redirect_to :back
		else
			flash[:error] = 'Not able to join event at this time'
			redirect_to :back
		end		
	end	


end
