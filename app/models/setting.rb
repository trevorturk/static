require 'digest/md5'

class Setting < ActiveRecord::Base
  
  attr_accessible :layout, :password
  attr_accessor :password
  
  validates_presence_of :layout
  
  before_save :encrypt_password
  
  def self.get
    first || Setting.create!(:layout => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb'))
  end
  
  def encrypt_password
    self.password_hash = Digest::MD5.hexdigest(['admin','admin',password].join(":")) unless password.blank?
  end
  
end
