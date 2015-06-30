class Archives::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Archive.find(params[:archive_id])
	end
end