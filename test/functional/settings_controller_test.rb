require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  
  test "should update settings" do
    s = Setting.get
    put :update, :id => s.id, :setting => {:theme => 'changed'}
    assert_equal 'changed', Setting.get.theme
    assert_redirected_to admin_path
  end
  
end
