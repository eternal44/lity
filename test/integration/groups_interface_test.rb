require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:james)
  end

  test "groups interface" do
  	assert_no_difference 'Group.count' do
  		post groups_path, groups: { group_name: "testing" }
  	end
  end
end