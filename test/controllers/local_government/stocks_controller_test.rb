require "test_helper"

class LocalGovernment::StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get local_government_stocks_new_url
    assert_response :success
  end

  test "should get edit" do
    get local_government_stocks_edit_url
    assert_response :success
  end
end
