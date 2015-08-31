require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "h2", "About"
  end

end
