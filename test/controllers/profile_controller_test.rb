require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get star" do
    get profile_star_url
    assert_response :success
  end

end
