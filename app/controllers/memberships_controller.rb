class Groups::MembershipsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_group

	def new
		@membership = Membership.new
	end

	def index
		# @group = Group.find(params[:id])
		# # @memberships = @group.memberships
		@memberships = Membership.all
	end

	def edit
		@membership = Membership.find(params[:id])
	end

	def update
		@membership = Membership.find(params[:id])

		if @membership.update(membership_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	def create
		@membership = Membership.create(membership_params)		

		if @membership.save
			redirect_to group_path(@group, notice: "Member successfully added!")
		else
			redirect_to @membership, alert: "Unable to add member"
		end
	end

	def destroy
		@membership = Membership.find(params[:id])
		@membership.destroy
		redirect_to memberships_path
	end

	private
		def set_group
			@group = Group.find(params[:group_id])
		end

		def membership_params
			params.require(:membership).permit(:user_id, :group_id, :group_role, groups_attributes: [:group_name])
		end
end