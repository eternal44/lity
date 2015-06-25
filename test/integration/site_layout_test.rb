require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest


	test "layout links for signed in user" do
		get new_user_session_path
		# click_link 'Sign up'

		assert_template 'shared/_navbar'
		assert_select "a[href=?]", groups_path
		assert_select "a[href=?]", users_path
		# assert_select "a[href=?]", destroy_user_session_path
	end
end