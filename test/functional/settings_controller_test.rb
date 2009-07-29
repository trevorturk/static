require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  
  test "should update settings" do
    s = Setting.get
    put :update, :id => s.id, :setting => {:layout => 'changed'}
    assert_equal 'changed', Setting.get.layout
    assert_redirected_to admin_path
  end
  
end
