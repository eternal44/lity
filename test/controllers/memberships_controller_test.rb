require 'test_helper'

class Groups::MembershipsControllerTest < ActionController::TestCase
	def setup
		@user = users(:james)
    @group = groups(:one)
  end

  # test 'should create new member' do
  #   sign_in @user
  #   assert_difference('Membership.count') do
  #     post :create, membership: {group_id: @group, user_id: @user}
  #   end
  # end

end
