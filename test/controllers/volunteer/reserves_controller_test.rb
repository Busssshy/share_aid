require "test_helper"

class Volunteer::ReservesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get volunteer_reserves_index_url
    assert_response :success
  end
end
