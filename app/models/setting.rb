require 'digest/md5'

class Setting < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :layout, :password
  validates_presence_of :layout
  before_save :encrypt_password

  def encrypt_password
    self.password_hash = Digest::MD5.hexdigest(['admin','admin',password].join(":")) unless password.blank?
  end
end