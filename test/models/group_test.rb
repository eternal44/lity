# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  group_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase

	def setup
		@user = users(:james)
		@group = @user.groups.new(group_name: "hello456")
		# @membership = @group.memberships.build(user_id: @user.id, group_)
	end

	test "associated group should NOT be destroyed" do
		@user.save
		@group.save
		assert_no_difference 'Group.count' do
			@user.destroy
		end
	end

	test "only members can create archives" do
	end

	test "validated archives show ______" do
	end
end
