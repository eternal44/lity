require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

	def setup
		@user = users(:james)
		@group = groups(:one)
	end

	test "should get groups" do
		get :index
		assert_response :success
	end
end