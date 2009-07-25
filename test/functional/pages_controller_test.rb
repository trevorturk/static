require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  test "show" do
    p = Page.make
    get :show, :slug => p.slug
    assert_response :success
  end
  
  test "show requires page" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, :slug => 'invalid'
    end
  end
  
end
