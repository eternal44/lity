# == Schema Information
#
# Table name: friend_requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friend_requests_on_friend_id  (friend_id)
#  index_friend_requests_on_user_id    (user_id)
#

require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @user = users(:james)
    @friend = users(:phillip)
    @new_friend = users(:steve)
    @friend_request = FriendRequest.new(user_id: @user.id,
                                        friend_id: @friend.id)
                                            
  end

  test "friend_request should be valid" do
    assert @friend_request.valid?
  end

  test "friend request shouldn't be self" do
    @friend_request.friend_id = @user.id
    assert_not @friend_request.valid?
  end
  
  test "should not already be friends" do
    @friend_request.friend_id = @new_friend.id
    assert_not @friend_request.valid? 
  end

  # test "user should not be empty" do
  #   @friend_request.user_id = ""
  #   puts @friend_request.inspect
  #   assert_not @friend_request.valid?
  # end
  
end
