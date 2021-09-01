require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get pending_users" do
    get users_pending_users_url
    assert_response :success
  end
end
