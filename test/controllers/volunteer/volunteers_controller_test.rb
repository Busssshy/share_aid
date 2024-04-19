require "test_helper"

class Volunteer::VolunteersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get volunteer_volunteers_show_url
    assert_response :success
  end

  test "should get edit" do
    get volunteer_volunteers_edit_url
    assert_response :success
  end
end
