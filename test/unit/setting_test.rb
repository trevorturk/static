require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  
  test "make" do
    assert_difference 'Setting.count' do
      s = Setting.make
      assert s.valid?
    end
  end
  
  test "should require key" do
    assert_no_difference 'Setting.count' do
      s = Setting.new(:key => nil)
      assert !s.valid?
      assert s.errors.on(:key)
    end
  end
  
  test "should require value" do
    assert_no_difference 'Setting.count' do
      s = Setting.new(:value => nil)
      assert !s.valid?
      assert s.errors.on(:value)
    end
  end
  
  test "validates_uniqueness_of key" do
    s1 = Setting.make
    assert_no_difference 'Setting.count' do
      s2 = Setting.new(:key => s1.key)
      assert !s2.valid?
      assert s2.errors.on(:key)
    end
  end
  
  test "get" do
    s = Setting.make
    assert_equal s.value, Setting.get(s.key)
  end
  
  test "get doesn't bomb if setting not found" do
    assert_nothing_raised do
      Setting.get('invalid')
    end
  end
  
end
