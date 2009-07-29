class Setting < ActiveRecord::Base
  
  attr_accessible :layout, :password
  
  validates_presence_of :layout
  
  def self.get
    setting = first
    if setting.nil?
      setting = Setting.create!(:layout => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb'))
    end
    setting
  end
  
end
