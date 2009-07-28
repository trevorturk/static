class Upload < ActiveRecord::Base
  require 'open-uri'
  
  attr_accessible :attachment, :attachment_url, :attachment_remote_url
  attr_accessor :attachment_url
  
  if CONFIG['s3']
    has_attached_file :attachment, 
                      :storage => :s3, 
                      :path => ":basename_:style.:extension", 
                      :default_style => :medium,
                      :bucket => CONFIG['s3_bucket_name'],
                      :s3_credentials => { :access_key_id => CONFIG['s3_access_id'], :secret_access_key => CONFIG['s3_secret_key'] },
                      :s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate },
                      :styles => { :square => '75x75#', :thumb => '100x100>', :small => '240x240>', :medium => '500x500>', :large => '1024x1024>' }
  else
    has_attached_file :attachment, 
                      :storage => :filesystem, 
                      :url => "/uploads/:basename_:style.:extension",
                      :default_style => :medium,
                      :styles => { :square => '75x75#', :thumb => '100x100>', :small => '240x240>', :medium => '500x500>', :large => '1024x1024>' }
  end
  
  before_validation :download_remote_file, :if => :attachment_url_provided?
  
  validates_presence_of :attachment_file_name
  validates_presence_of :attachment_remote_url, :if => :attachment_url_provided?, :message => 'is invalid or inaccessible'
  validates_uniqueness_of :attachment_file_name
  
  before_post_process :image?
  
  def image?
    !(attachment_content_type =~ /^image.*/).nil?
  end
  
  def to_s
    attachment_file_name
  end
  
  private
  
  def attachment_url_provided?
    !self.attachment_url.blank?
  end
  
  def download_remote_file
    self.attachment = do_download_remote_file
    self.attachment_remote_url = attachment_url
  end
  
  def do_download_remote_file
    io = open(URI.parse(attachment_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
  
end
