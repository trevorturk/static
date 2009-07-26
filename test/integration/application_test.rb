require "test_helper"

class ApplicationTest < ActionController::IntegrationTest

  test "slug_path" do
    p = Page.make
    get "/#{p.slug}"
    assert_response :success
  end
  
  test "blank app" do
    Page.destroy_all
    Setting.destroy_all
    get "/"
    assert_response :success
  end
  
end
