class Setting < ActiveRecord::Base
  
  attr_accessible :theme
  
  validates_presence_of :theme
  
  def self.get
    setting = first
    setting = Setting.create!(:theme => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb')) if setting.nil?
    setting
  end
  
end
