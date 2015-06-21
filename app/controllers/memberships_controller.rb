class MembershipsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_group, except: [:index, :show]

	def new
		@membership = Membership.new
		@memberships = @group.memberships
	end

	def create
		@membership = @group.memberships.new(membership_params)		

		if @membership.save
			redirect_to group_path(@group, notice: "Member successfully added!")
		else
			redirect_to @membership, alert: "Unable to add member"
		end
	end

	private
		def set_group
			@group = Group.find(params[:group_id])
		end

		def membership_params
			params.require(:membership).permit(:user_id, :group_id, :group_role)
		end
end