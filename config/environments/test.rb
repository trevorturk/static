Bundler.require_env RAILS_ENV
config.cache_classes = true
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching = false
config.action_view.cache_template_loading = true
config.action_controller.allow_forgery_protection = false
config.action_mailer.delivery_method = :test
config.logger = Logger.new(config.log_path, 2, 20.megabytes) # Automatically rotate log files
Paperclip.options[:command_path] = '/opt/local/bin/' # for OS X with passenger