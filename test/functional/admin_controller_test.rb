require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  test "should get empty index" do
    get :index
    assert_response :success
  end
  
  test "should get full index" do
    Page.make
    Setting.make
    Upload.make
    get :index
    assert_response :success
  end

end
