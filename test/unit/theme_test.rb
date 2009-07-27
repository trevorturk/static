require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  
  test "should require body" do
    assert_no_difference 'Theme.count' do
      t = Theme.new(:body => nil)
      assert !t.valid?
      assert t.errors.on(:body)
    end
  end
  
  test "get returns theme if exists and creates a default one if doesn't" do
    assert_difference 'Theme.count' do
      Theme.get
    end
    assert_no_difference 'Theme.count' do
      Theme.get
    end
  end
  
end
