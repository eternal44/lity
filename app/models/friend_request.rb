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

class FriendRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

	validates :user, presence: true  
	# validates :friend, presence: true, uniqueness: { scope: :user } 
	
	validate :not_self	
	validate :not_friends
	validate :not_pending

  def not_self  
	  errors.add(:friend, "can't be equal to user") if user == friend
	end 

	private
		def not_friends
			errors.add(:friend, 'is already added') if user.friends.include?(friend)
		end

		def not_pending
			errors.add(:friend, 'already requested friendship') if friend.pending_friends.include?(user)
		end
end
