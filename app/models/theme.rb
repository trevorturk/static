class Theme < ActiveRecord::Base
  
  attr_accessible :body
  
  validates_presence_of :body
  
  def self.get
    theme = first
    theme = Theme.create!(:body => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb')) if theme.nil?
    theme
  end
  
end
