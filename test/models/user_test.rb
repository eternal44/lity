# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = users(:james)
    @friend_request = friend_requests(:one)
	end

	def test_valid?
		assert @user.valid?
	end

	test "associated archive should be destroyed" do
		assert_difference 'Archive.count', -1 do 
			@user.destroy
		end
	end

	test "associated memberships should be destroyed" do
		assert_difference 'Membership.count', -1 do 
			@user.destroy
		end
	end

	test "associated friend_requests should be destroyed" do
		assert_difference '@user.friend_requests.count', -1 do 
			@user.destroy
		end
	end

	test "associated pending_requests should be destroyed" do
		assert_difference 'Archive.count', -1 do 
			@user.destroy
		end
	end

	test "associated friendships should be destroyed" do
		assert_difference 'Friendship.count', -1 do 
			@user.destroy
		end
	end

	test "associated friends should be destroyed" do
		assert_difference '@user.friends.count', -1 do 
			@user.destroy
		end
	end
end
