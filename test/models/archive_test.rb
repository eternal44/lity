# == Schema Information
#
# Table name: archives
#
#  id          :integer          not null, primary key
#  group_id    :integer
#  user_id     :integer
#  lift_name   :text
#  lift_weight :integer
#  video_link  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ArchiveTest < ActiveSupport::TestCase

	def setup
		@user = users(:james)
		@group = groups(:one)
		@archive = @user.archives.build(group_id: @group.id, user_id: @user.id, lift_name: "Squat", lift_weight: 200, video_link: "https://www.youtube.com/watch?v=VwQr4fGL2pc")
	end

	test "group_id should be valid" do
		@archive.group_id = nil
		assert_not @archive.valid?
	end

	test "user_id should be valid" do
		@archive.user_id = nil
		assert_not @archive.valid?
	end	

	test "user id should be present" do
		@archive.user_id = nil
		assert_not @archive.valid?
	end
end
