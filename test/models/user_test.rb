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

	def user
		@user ||= users(:james)
	end

	def test_valid?
		assert user.valid?
	end


	# def setup
	# 	@user = User.new(first_name: "James", last_name: "Youn", email: "boggy@example.com", password: "hello123", password_confirmation: "hello123")
	# end

	# test "associated archive should be destroyed" do
	# 	@user.save
	# 	@user.archives.create(group_id: 1, lift_name: "Squat", lift_weight: 200, video_link: "http://www.google.com")
	# 	assert_difference 'Archive.count', -1 do 
	# 		@user.destroy
	# 	end
	# end
end
