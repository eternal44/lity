class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]	
  before_action :set_group, only: [:show, :edit, :update, :destroy]


	def index
		@groups = Group.all
		# authorize @groups
	end

	def new
		@group = Group.new
		# @group.archives.new
		# authorize @group
		# authorize @group.archives
	end

	def create
		@group = current_user.groups.new(group_params)
		
		# authorize @group

		if @group.save
			redirect_to @group
		else
			render action: :new
		end
	end

	def show
		@group = Group.find(params[:id])
		@archive = Archive.new
		@membership = Membership.where(group_id: (params[:id]))
	end

	private
		def set_group
			@group = Group.find(params[:id])
			# authorize @group
		end

		def group_params
			params.require(:group).permit(:group_name)
		end
end