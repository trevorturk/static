class Setting < ActiveRecord::Base
  
  attr_accessible :theme
  
  validates_presence_of :theme
  
  # before_create false
  # before_destroy false
  
  def self.get
    setting = first
    setting = Setting.create!(:theme => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb')) if setting.nil?
    setting
  end
  
end
