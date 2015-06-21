class Groups::MembershipsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_group

	def new
		@membership = Membership.new
	end

	def index
		@memberships = @group.memberships
	end

	def edit
		@membership = Membership.find(params[:id])
	end

	def update
		@membership = Membership.find(params[:id])

		if @membership.update(membership_params)
			redirect_to group_memberships_path(@group)
		else
			render :edit
		end
	end

	def create
		@membership = @group.memberships.new(membership_params)		

		if @membership.save
			redirect_to group_path(@group, notice: "Member successfully added!")
		else
			redirect_to @membership, alert: "Unable to add member"
		end
	end

	def destroy
		@membership = Membership.find(params[:id])
		@membership.destroy
		redirect_to group_memberships_path(@group)
	end

	private
		def set_group
			@group = Group.find(params[:group_id])
		end

		def membership_params
			params.require(:membership).permit(:user_id, :group_id, :group_role)
		end
end