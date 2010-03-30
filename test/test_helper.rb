ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/blueprints")
require 'test_help'

class ActiveSupport::TestCase

  setup do
    Sham.reset
  end

  def deauthenticate!
    Setting.get.update_attribute(:password, 'password')
  end
end