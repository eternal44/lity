require 'test_helper'

class Groups::ArchivesControllerTest < ActionController::TestCase

  def setup
    @archive = archives(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:archives)
  # end

	# test "should redirect create when not logged in" do
	# 	assert_no_difference 'Archive.count' do
	# 		delete :destroy, id: @archive
	# 	end
	# 	assert_redirected_to new_user_session_url
	# end

end
