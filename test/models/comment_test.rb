# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  user_id          :integer
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
  end

  test "comment should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
    @comment.body = ""
    assert_not @comment.valid?
  end
end
