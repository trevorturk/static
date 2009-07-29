class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  
  before_filter :get_settings, :authenticate
  
  protected
  
  def get_settings
    @settings = Setting.get
  end
  
  def authenticate
    unless @settings.password_hash.blank?
      authenticate_or_request_with_http_digest('admin') do |admin|
        @settings.password_hash
      end
    end
  end
  
end
