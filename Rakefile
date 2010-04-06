require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

namespace :s3 do
  task :create => :environment do
    desc "Create S3 bucket"
    AWS::S3::Base.establish_connection!(:access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key'])
    AWS::S3::Bucket.create(ENV['s3_bucket_name'], :access => :public_read)
  end
end

namespace :test do
  desc "Run remote tests"
  task :remote => :environment do
    Dir.glob('test/remote/*.rb').each {|f| ruby f}      
  end
end