require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end
  
  test "show" do
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
    assert_redirected_to slug_path(assigns(:page).slug)
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
    assert_redirected_to slug_path(assigns(:page).slug)
  end

  test "should destroy page" do
    p = Page.make
    assert_difference('Page.count', -1) do
      delete :destroy, :id => p.to_param
    end
    assert_redirected_to root_path
  end
  
  test "should get home" do
    p = Page.make(:title => 'home')
    get :home
    assert_equal p, assigns(:page)
  end
  
  test "should create and get home if no pages exist" do
    Page.destroy_all
    assert_difference 'Page.count' do
      get :home
      assert_equal Page.home, assigns(:page)
    end
  end
  
  test "should use custom layout if provided for show or home actions" do
    p = Page.make
    Setting.make(:key => 'layout', :value => '<title><%= "custom" + " layout" %></title>')
    get :show, :id => p.slug
    assert_select 'title', 'custom layout'
    get :home
    assert_select 'title', 'custom layout'
  end
  
end
