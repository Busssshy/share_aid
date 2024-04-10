require "test_helper"

class Volunteer::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get volunteer_users_show_url
    assert_response :success
  end
end
