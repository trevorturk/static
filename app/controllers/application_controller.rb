class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  
  before_filter :authenticate
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_digest('admin') do |username|
      # Digest::MD5.hexdigest(["username",'Admin',"password"].join(":"))
      "26b7f9a787bf6a491f4ea6483c79eebe"
    end
  end
  
end
