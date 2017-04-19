class UsersController < ApplicationController
	def new
		@states = State.all
	end	
	def create
		user = User.new(user_params.merge(state:State.find(user_params[:state])))
		if user.valid?
			user.save
			session[:user_id]= user.id
			redirect_to '/events'
		else
			flash[:reg_errors] = user.errors.full_messages
			redirect_to '/'	
		end	
	end

	def dash
		redirect_to '/events'
	end	




	private
		def user_params
			params.require(:user).permit(:name,:email,:city,:state,:password,:password_confirmation)
		end	

end
