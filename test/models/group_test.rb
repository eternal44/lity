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
    @group = groups(:one) 
    # @commment = comments(:one)
  end

  test "associated group should NOT be destroyed" do
    assert_no_difference 'Group.count' do
      @user.destroy
    end
  end

  test "should be valid" do
    assert @group.valid?
  end

  test "should delete related archives" do
    assert_difference 'Archive.count', -2 do
      @group.destroy
    end
  end

  # test "should delete related memberships" do
  #   assert_difference 'Membership.count', -2 do
  #     @group.destroy
  #   end
  # end

  # test "should delete related comments" do
  #   assert_difference '@group.comments.count', -1 do
  #     @group.destroy
  #   end
  # end
end
