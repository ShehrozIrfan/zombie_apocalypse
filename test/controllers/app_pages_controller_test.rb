require 'test_helper'

class AppPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get app_pages_sign_up_url
    assert_response :success
  end

end
