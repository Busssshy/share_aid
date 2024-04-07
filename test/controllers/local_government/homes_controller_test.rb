require "test_helper"

class LocalGovernment::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get local_government_homes_top_url
    assert_response :success
  end
end
