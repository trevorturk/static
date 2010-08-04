RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  require 'active_support' # stubbing out session support, use 'rake secret' if sessions needed
  config.action_controller.session = {:key => 'static', :secret => ActiveSupport::SecureRandom.hex(32)}
  config.frameworks -= [:active_resource, :action_mailer]
  config.time_zone = 'UTC'
  config.gem 'paperclip', :version => '2.3.3'
  config.gem 'aws-s3', :version => '0.6.2', :lib => 'aws/s3'
end