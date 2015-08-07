# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friendships_on_friend_id  (friend_id)
#  index_friendships_on_user_id    (user_id)
#

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:james)
    @friend = users(:phillip)
    @friendship = Friendship.new(user_id: @user.id, friend_id: @friend.id)
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require a user_id" do
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test "should require a friend_id" do
    @friendship.friend_id = nil
    assert_not @friendship.valid?
  end

  test "should not be self" do
    @friendship.friend_id = @user.id
    assert_not @friendship.valid?
  end

  test "should create inverse relationship" do
    @friendship.save
    assert_equal Friendship.last.user_id, @friend.id
    assert_equal Friendship.last.friend_id, @user.id
  end


  test "should destroy inverse relationship" do
    @friendship.save
    assert_equal Friendship.last.user_id, @friend.id
    assert_equal Friendship.last.friend_id, @user.id

    assert Friendship.count, -2 do
      @friendship.destroy
    end
  end
end
