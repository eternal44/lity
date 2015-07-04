class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action only: [:index, :show]

	def index
		@q = User.search(params[:q])
		@users = @q.result(distinct: true) #generates one result even though multiple instances might be found
	end

	def show
		@user = User.find(params[:id])
		@archives = Archive.where(user_id: @user.id)
		@incoming = FriendRequest.where(friend: current_user) 
		@outgoing = current_user.friend_requests 
	end

	def destroy  
	  @friend_request.destroy
	  redirect_to user
	end  

	def update
		@friend_request = FriendRequest.find(params[:id])
		@friend_request.accept
		head :no_content
		# redirect_to :users_path
	end



	private

		# def set_user
		# 	@user = User.find(params[:id])
		# end



  #moved this in from the user model.  originally dan wanted it in friend_request model
	  def accept
	    user.friends << friend
	    destroy
	  end
		
		def user_params
			params.require(:user).permit(memberships_attributes: [:group_name])
		end
end
