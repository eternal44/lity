class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action only: [:index, :show]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	private

		# def set_user
		# 	@user = User.find(params[:id])
		# end
		
		def user_params
			params.require(:user).permit(memberships_attributes: [:group_name])
		end
end
