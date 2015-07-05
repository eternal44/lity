class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def create
		friend = User.find(params[:user_id])
		@friend_request = current_user.friend_requests.new(friend: friend) 

		if @friend_request.save
			redirect_to request.referrer

		else
			render json: @friend_request.errors, status: :unprocessable_entity
		end
	end

	def update
		user = @friend_request.user
		user.friends << @friend_request.friend

		@friend_request.destroy
		redirect_to request.referrer
	end

	def destroy
		@friend_request.destroy
		redirect_to request.referrer
	end

	private
		def set_friend_request
			@friend_request = FriendRequest.find(params[:id])
		end

		def friend_request_params
			params.require(:friend_request).permit(:user_id, :friend_id)
		end
end
