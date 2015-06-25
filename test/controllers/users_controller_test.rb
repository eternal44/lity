class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

	def setup
		@user = users :james
		sign_in @user
	end

	def teardown
		sign_out @user
	end

	def test_show
		get :show, id: @user
		assert_response :success
	end

  test "logged in should get show" do
    sign_in @user
    assert @user.first_name == "James"
    # assert_template "shared/_navbar"
    # get root_path
		# assert_select "a[href=?]", users_path
  end
end