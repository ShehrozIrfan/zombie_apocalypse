require 'test_helper'

class SurvivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get survivals_new_url
    assert_response :success
  end

end
