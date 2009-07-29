class Setting < ActiveRecord::Base
  
  attr_accessible :layout, :password
  attr_accessor :password
  
  validates_presence_of :layout
  
  before_save :encrypt_password
  
  def self.get
    setting = first
    if setting.nil?
      setting = Setting.create!(:layout => File.read(File.dirname(__FILE__) + '/../views/layouts/application.html.erb'))
    end
    setting
  end
  
  def encrypt_password
    return if password.blank?
    self.password_hash = Digest::MD5.hexdigest(['admin','admin',password].join(":"))
  end
  
end
