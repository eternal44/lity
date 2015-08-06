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
    @archive = archives(:archive_1)
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

  test "newest archive should be on top" do
    assert_equal Archive.first, archives(:most_recent)
  end

end
