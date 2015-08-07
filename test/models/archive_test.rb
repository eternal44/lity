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
    @archive = archives(:one)
    @user = users(:james)
  end

  test "should be valid" do
    assert @archive.valid?
  end

  test "user id should be present" do
    @archive.user_id = nil
    assert_not @archive.valid?
  end

  test "group_id should be present" do
    @archive.group_id = nil
    assert_not @archive.valid?
  end

  test "lift_name should be present" do
    @archive.lift_name = nil
    assert_not @archive.valid?
  end

  test "lift_weight should be present" do
    @archive.lift_weight = nil
    assert_not @archive.valid?
  end

  test "newest archive should be on top" do
    assert_equal Archive.first, archives(:most_recent)
  end

  test "video format should be valid" do
    @archive.video_link = "yvewtewyb.com"
    assert_not @archive.valid?
  end

  test "associated comments should be deleted" do
    Comment.create(commentable_type: Archive,
                   commentable_id: @archive.id,
                   user_id: @user.id,
                   body: "This is great!")

    assert_difference 'Comment.count', -2 do
      @archive.destroy
    end
  end
end
