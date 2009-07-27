require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  test "should get empty index" do
    get :index
    assert_response :success
  end
  
  test "should get full index" do
    Page.make
    Upload.make
    get :index
    assert_response :success
  end
  
  test "should update settings" do
    Setting.get
    post :settings, :setting => {:theme => 'changed'}
    assert_equal 'changed', Setting.get.theme
    assert_redirected_to admin_path
  end

end
