class EventsController < ApplicationController


	def index
		@events = Event.includes(:user).where.not(state:current_user.state)
		@states = State.all
		@locals = Event.includes(:user).where(state:current_user.state)
	end	


	def create

		event = Event.new(event_params.merge(state:State.find(event_params[:state]),user: current_user))

		if event.valid?
			event.save
			redirect_to '/events'
		else
			flash[:event_errors] = event.errors.full_messages
			redirect_to '/events'
		end		

	end
	def delete
		Event.find(params[:id]).destroy
		redirect_to '/events'
	end	
	def show
		@event= Event.find(params[:id])
		@visitors = Event.find(params[:id]).attendees
		@comments = Comment.where(event:params[:id])
	end	



	private
		def event_params
			params.require(:event).permit(:name,:date,:city,:state,:user)
		end		
end
