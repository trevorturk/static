class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery
  
  # before_filter :authenticate
  
  # def authenticate
  #   authenticate_or_request_with_http_digest('admin') do |admin|
  #     'admin'
  #   end
  # end
  
end
