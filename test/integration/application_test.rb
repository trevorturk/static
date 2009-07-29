require "test_helper"

class ApplicationTest < ActionController::IntegrationTest

  test "page_path" do
    p = Page.make
    get "/#{p.slug}"
    assert_response :success
  end
  
  test "blank app" do
    Page.destroy_all
    Setting.destroy_all
    Upload.destroy_all
    assert_difference 'Page.count' do
      get "/"
    end
    assert_response :success
    assert Page.last.slug == 'home'
  end
  
end
