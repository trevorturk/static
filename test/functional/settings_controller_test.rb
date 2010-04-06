require 'test_helper'

class SettingsControllerTest < ActionController::TestCase

  test "should update settings" do
    s = Setting.first
    put :update, :id => s.id, :setting => {:layout => 'changed'}
    s.reload
    assert_equal 'changed', s.layout
    assert_redirected_to admin_path
  end

  test "should update password" do
    s = Setting.first
    put :update, :id => s.id, :setting => {:password => 'changed'}
    s.reload
    assert_equal Digest::MD5.hexdigest(['admin','admin','changed'].join(":")), s.password_hash
  end
end