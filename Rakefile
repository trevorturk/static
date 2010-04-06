require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

namespace :s3 do
  task :create => :environment do
    desc "Create S3 bucket"
    AWS::S3::Base.establish_connection!
    AWS::S3::Bucket.create(ENV['AMAZON_S3_BUCKET_NAME'], :access => :public_read)
  end
end

namespace :test do
  desc "Run remote tests"
  task :remote => :environment do
    Dir.glob('test/remote/*.rb').each {|f| ruby f}      
  end
end