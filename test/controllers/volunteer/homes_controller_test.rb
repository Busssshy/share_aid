require "test_helper"

class Volunteer::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get volunteer_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get volunteer_homes_about_url
    assert_response :success
  end
end
