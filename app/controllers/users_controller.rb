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
	end

	private

		# def set_user
		# 	@user = User.find(params[:id])
		# end
		
		def user_params
			params.require(:user).permit(memberships_attributes: [:group_name])
		end
end
