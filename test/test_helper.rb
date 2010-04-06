ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require File.expand_path(File.dirname(__FILE__) + "/blueprints")
require 'test_help'

class ActiveSupport::TestCase

  setup do
    Sham.reset
    Page.make(:title => 'home')
    Setting.create!(:layout => '<%= yield %>')
  end

  def deauthenticate!
    Setting.first.update_attribute(:password, 'password')
  end
end