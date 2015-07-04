class FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def create
		friend = ""
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

	def index
		# @incoming = FriendRequest.where(friend: current_user) #moved this to users#show
		# @outgoing = current_user.friend_requests #moved this to users#show
	end

	def destroy
		@friend_request.destroy
		redirect_to request.referrer
	end

	private
		def set_friend_request
			@friend_request = FriendRequest.find(params[:id])
		end

end
