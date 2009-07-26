require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, :setting => Setting.plan
    end
    assert_redirected_to settings_path
  end
  
  test "should get edit" do
    s = Setting.make
    get :edit, :id => s.to_param
    assert_response :success
  end

  test "should update setting" do
    s = Setting.make
    put :update, :id => s.to_param, :setting => { }
    assert_redirected_to settings_path
  end

  test "should destroy setting" do
    s = Setting.make
    assert_difference('Setting.count', -1) do
      delete :destroy, :id => s.to_param
    end
    assert_redirected_to settings_path
  end
  
end
