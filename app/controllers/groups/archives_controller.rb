class ArchivesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_archive

	def create
		@archive = @group.archives.new(archive_params)
		@archive.user = current_user

		if @archive.save
			redirect_to group_path(@group, notice: "Record successfully posted!")
		else
			redirect_to @group, alert: "Unable to save your record"
		end
	end

	private

		def set_archive
			@group = Group.find(params[:group_id])
		end

		def archive_params
			params.require(:archive).permit(:user_id, :lift_name, :lift_weight, :video_link)
		end
end
