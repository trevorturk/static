ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/blueprints")
require 'test_help'

class ActiveSupport::TestCase
  
  setup do
    Sham.reset
  end
  
  def authenticate!
    @controller.stubs(:authenticate_with_http_digest).returns true
  end
  
end
