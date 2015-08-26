require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
	def setup
		@user = users(:james)
		@group = groups(:one)
	end

	test "should get index" do
    sign_in @user
		get :index
		assert_response :success
    assert_not_nil assigns(:groups)
	end

  test "should get show" do
    sign_in @user
    get :show, id: @group
    assert_response :success
  end

  test 'should create group' do
    sign_in @user
    assert_difference('Group.count') do
      post :create, group: {group_name: 'Jams'}
    end
    assert_redirected_to group_path(assigns(:group))
  end
end
