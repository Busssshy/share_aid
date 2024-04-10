require "test_helper"

class LocalGovernment::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get local_government_genres_index_url
    assert_response :success
  end

  test "should get new" do
    get local_government_genres_new_url
    assert_response :success
  end
end
