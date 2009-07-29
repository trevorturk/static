require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "should get empty index" do
    get :index
    assert_response :success
  end
  
  test "should get full index" do
    Page.make
    Setting.get
    Upload.make
    get :index
    assert_response :success
  end
  
  # test "index requires authentication" do
  #   get :index
  #   assert_response :unauthorized
  # end
  
  test "show" do
    p = Page.make
    get :show, :id => p.slug
    assert_response :success
  end
  
  test "show doesn't require authentication" do
    p = Page.make
    get :show, :id => p.slug
    assert_response :success
  end
  
  test "show requires page" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, :slug => 'invalid'
    end
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, :page => Page.plan
    end
    assert_redirected_to admin_path
  end
  
  test "should get edit" do
    p = Page.make
    get :edit, :id => p.to_param
    assert_response :success
  end

  test "should update page" do
    p = Page.make
    put :update, :id => p.to_param, :page => { :title => 'changed' }
    p.reload
    assert_equal 'changed', p.title
    assert_redirected_to admin_path
  end

  test "should destroy page" do
    p = Page.make
    assert_difference('Page.count', -1) do
      delete :destroy, :id => p.to_param
    end
    assert_redirected_to admin_path
  end
  
  test "should get home" do
    p = Page.make(:title => 'home')
    get :show, :id => 'home'
    assert_equal p, assigns(:page)
  end
  
  test "should create and get home if no pages exist" do
    Page.destroy_all
    assert_difference 'Page.count' do
      get :show, :id => 'home'
      assert_equal Page.home, assigns(:page)
    end
  end
  
  test "should use custom layout for show or home actions" do
    p = Page.make
    Setting.get.update_attribute(:theme, '<title><%= "custom" + " layout" %></title>')
    get :show, :id => p.slug
    assert_select 'title', 'custom layout'
    get :show, :id => 'home'
    assert_select 'title', 'custom layout'
  end
  
end
