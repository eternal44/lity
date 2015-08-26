class Groups::ArchivesController < ApplicationController
	before_action :set_group

	def show
		@archive = @group.archives.find(params[:id])
	end

	def create
		@archive = @group.archives.new(archive_params)
		@archive.user = current_user

		if @archive.save
			redirect_to request.referrer || root_url, notice: "Record successfully posted!"
		else
			redirect_to @group, notice: "Unable to save your record"
		end
	end

	def edit
		@archive = Archive.find(params[:id])
	end

	def update
		@archive = Archive.find(params[:id])

		if @archive.update(archive_params)
			redirect_to @archive.group
		else
			render :edit
		end
	end

	def destroy
		@archive = Archive.find(params[:id])
		@archive.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer || root_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

		def set_group
			@group = Group.find(params[:group_id])
		end

		def archive_params
			params.require(:archive).permit(:user_id, :lift_name, :lift_weight, :video_link)
		end
end
