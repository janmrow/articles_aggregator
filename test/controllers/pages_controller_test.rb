require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "should get about and have heading and render correct template" do
    get :about
    assert_response :success
    assert_template :about
    assert_select "h2", "About"
  end

end
