require 'test_helper'

class GroupsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:james)
  end

  test "group show links" do
    login_as(@user)
    get users_path(@user)
    assert_template 'users/index'
    
  end
end

