require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  
  test "should update settings" do
    s = Setting.get
    put :update, :id => s.id, :setting => {:layout => 'changed'}
    assert_equal 'changed', Setting.get.layout
    assert_redirected_to admin_path
  end
  
  test "should update password" do
    s = Setting.get
    put :update, :id => s.id, :setting => {:password => 'changed'}
    assert_equal Digest::MD5.hexdigest(['admin','admin','changed'].join(":")), Setting.get.password_hash
  end
  
end
