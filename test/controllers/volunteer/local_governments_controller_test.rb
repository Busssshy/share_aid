require "test_helper"

class Volunteer::LocalGovernmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get volunteer_local_governments_index_url
    assert_response :success
  end

  test "should get show" do
    get volunteer_local_governments_show_url
    assert_response :success
  end
end
