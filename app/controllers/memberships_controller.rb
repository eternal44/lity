class Groups::MembershipsController < ApplicationController
	before_action :set_group
	before_action :set_membership

	def new
		@membership = Membership.new
	end

	def index
		@memberships = Membership.all
	end

	def edit
	end

	def update
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
		@membership.destroy
		redirect_to memberships_path
	end

	private
		def set_group
			@group = Group.find(params[:group_id])
		end

		def set_membership
      @membership = Membership.find(params[:id])
		end

		def membership_params
			params.require(:membership).permit(:user_id, :group_id, :group_role, groups_attributes: [:group_name])
		end
end
