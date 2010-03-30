require 'test_helper'

class PageTest < ActiveSupport::TestCase

  test "make" do
    assert_difference 'Page.count' do
      p = Page.make
      assert p.valid?
    end
  end

  test "should require title" do
    assert_no_difference 'Page.count' do
      p = Page.new(:title => nil)
      assert !p.valid?
      assert p.errors.on(:title)
    end
  end

  test "should require body" do
    assert_no_difference 'Page.count' do
      p = Page.new(:body => nil)
      assert !p.valid?
      assert p.errors.on(:body)
    end
  end

  test "validates_uniqueness_of title" do
    p1 = Page.make
    assert_no_difference 'Page.count' do
      p2 = Page.new(:title => p1.title)
      assert !p2.valid?
      assert p2.errors.on(:title)
    end
  end

  test "validates_uniqueness_of slug" do
    p1 = Page.make
    assert_no_difference 'Page.count' do
      p2 = Page.new(:slug => p1.slug)
      assert !p2.valid?
      assert p2.errors.on(:slug)
    end
  end

  test "before_validation create slug" do
    p = Page.make
    assert_equal p.slug, p.to_param
  end

  test "home" do
    p = Page.make(:title => 'home')
    assert_equal p, Page.home
  end

  test "home creates home page if none exists" do
    Page.destroy_all
    assert_difference 'Page.count' do
      p = Page.home
      assert_equal p, Page.home
      assert_equal 'Home', Page.last.title
    end
    assert_no_difference 'Page.count' do
      Page.home
    end
  end

  test "home? returns true if page is home, false otherwise" do
    p1 = Page.make(:title => 'home')
    p2 = Page.make
    assert p1.home?
    assert !p2.home?
  end

  test "to_s returns title" do
    p = Page.make
    assert_equal p.title, p.to_s
  end

  test "to_param returns to_s.parameterize" do
    p = Page.make
    assert_equal p.to_s.parameterize, p.to_param
  end
end