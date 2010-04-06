require "test_helper"

class ApplicationTest < ActionController::IntegrationTest

  test "authentication" do
    deauthenticate!
    get '/'
    assert_response :success
    get '/admin'
    assert_response :unauthorized
    get '/pages/home/edit'
    assert_response :unauthorized
    post '/pages', :page => Page.plan
    assert_response :unauthorized
  end

  test "slug_path" do
    p = Page.make
    get "/#{p.slug}"
    assert_response :success
  end
end