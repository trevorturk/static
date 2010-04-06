require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  test "should require layout" do
    assert_no_difference 'Setting.count' do
      s = Setting.new(:layout => nil)
      assert !s.valid?
      assert s.errors.on(:layout)
    end
  end
end