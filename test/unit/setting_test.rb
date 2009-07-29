require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  
  test "should require theme" do
    assert_no_difference 'Setting.count' do
      s = Setting.new(:layout => nil)
      assert !s.valid?
      assert s.errors.on(:layout)
    end
  end
  
  test "get returns setting if exists and creates a default one if doesn't" do
    assert_difference 'Setting.count' do
      Setting.get
    end
    assert_no_difference 'Setting.count' do
      Setting.get
    end
    assert_not_nil Setting.get.layout
  end
  
end
