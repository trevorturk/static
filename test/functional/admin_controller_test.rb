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
  
  test "should update theme" do
    t = Theme.get
    post :theme, :theme => {:body => 'changed'}
    assert_equal 'changed', Theme.get.body
    assert_redirected_to admin_path
  end

end
