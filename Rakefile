require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

namespace :s3 do
  task :create => :environment do
    desc "Create public S3 bucket"
    s3 = RightAws::S3.new(ENV['s3_access_id'], ENV['s3_secret_key'])
    RightAws::S3::Bucket.create(s3, ENV['s3_bucket_name'], true)
    s3.bucket(ENV['s3_bucket_name'])
    puts "Public S3 bucket is available: #{ENV['s3_bucket_name']}"
  end
end

namespace :test do
  desc "Run remote tests"
  task :remote => :environment do
    Dir.glob('test/remote/*.rb').each {|f| ruby f}      
  end
end