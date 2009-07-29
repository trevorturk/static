class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  
  before_filter :get_settings, :authenticate
  
  protected
  
  def get_settings
    @settings = Setting.get
  end
  
  def authenticate
    unless @settings.password.blank?
      authenticate_or_request_with_http_digest('admin') do |admin|
        @settings.password
      end
    end
  end
  
end
