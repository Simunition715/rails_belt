class CommentsController < ApplicationController
	def create

		comment = Comment.create(user: current_user, event:Event.find(params[:event_id]),comment:params[:comment])
		if comment.save

			p "Success!"
			redirect_to :back
		else 
			flash[:errors] = "Comment not permitted"
			p "Fail!"
			redirect_to :back
		end	
	end	
end
