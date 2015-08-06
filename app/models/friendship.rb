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

class Friendship < ActiveRecord::Base
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  validates :user_id, presence: true  
	validates :friend_id, presence: true, uniqueness: { scope: :user } 
	validate :not_self


  private

  	def create_inverse_relationship
  		friend.friendships.create(friend: user)
  	end

  	def destroy_inverse_relationship
  		friendship = friend.friendships.find_by(friend: user)
  		friendship.destroy if friendship
  	end
  	
  	def not_self  
		  errors.add(:friend, "can't be equal to user") if user_id == friend_id
		end 
end
