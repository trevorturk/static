require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

namespace :heroku do
  desc "sends production configuration variables to Heroku"
  task :config do
    puts "Reading config/config.yml and sending production configuration variables to Heroku..."
    CONFIG = YAML.load_file('config/config.yml')['production'] rescue {}
    command = "heroku config:add"
    CONFIG.each {|key, val| command << " #{key}=#{val} " if val }
    system command
  end
end

namespace :test do
  desc "Run remote tests"
  task :remote do
    Dir.glob('test/remote/*.rb').each do |file|
      ruby file
    end
  end
end

namespace :s3 do
  task :create => :environment do
    puts "Reading config/config.yml and creating a bucket on s3 for the production environment..."
    CONFIG = YAML.load_file('config/config.yml')['production'] rescue {}
    s3 = RightAws::S3.new(CONFIG['s3_access_id'], CONFIG['s3_secret_key'])
    RightAws::S3::Bucket.create(s3, CONFIG['s3_bucket_name'], true)
    s3.bucket(CONFIG['s3_bucket_name'])
    puts "OK"
  end
end