RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  require 'yaml'
  CONFIG = (YAML.load_file('config/config.yml')[RAILS_ENV] rescue {}).merge(ENV)
  config.frameworks -= [:active_resource, :action_mailer ]
  config.time_zone = 'UTC'
  config.gem 'thoughtbot-paperclip', :version => '2.3.0', :lib => 'paperclip', :source => 'http://gems.github.com'
  CONFIG['s3_access_id'] && CONFIG['s3_secret_key'] && CONFIG['s3_bucket_name'] ? CONFIG['s3'] = true : CONFIG['s3'] = false
  config.action_controller.session = {
    :key => CONFIG['session_key'],
    :secret => CONFIG['session_secret']
  }
end
