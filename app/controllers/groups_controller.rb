class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  helper GroupHelper

	def index
		@groups = Group.all
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to :back
    else
      render :edit
    end
  end

  def new
    @group = Group.new
    @group.archives.new #remove?
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @group.memberships.create(user_id: current_user.id, group_id: @group.id, group_role: "Admin")
      redirect_to @group
    else
      render action: :new
    end
  end

  def show
    @archive = Archive.new
    @lift_type = ["Squat", "Bench", "Deadlift", "Overhead Press"]
    @membership = Membership.where(group_id: (params[:id]))
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:group_name, {:user_ids => []})
    end
end
