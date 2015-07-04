class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend



  def index
  	@friends = current_user.friends
  end

  def destroy
  	@friend.destroy

    redirect_to request.referrer || root_url
  end

  private
  	def set_friend
  		@friend = Friendship.find(params[:id])
  	end
end

