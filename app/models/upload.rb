class Upload < ActiveRecord::Base
  require 'open-uri'

  attr_accessible :attachment, :attachment_url, :attachment_remote_url
  attr_accessor :attachment_url

  STYLES = { :square => '75x75#', :thumb => '100x100>', :small => '240x240>', :medium => '500x500>', :large => '1024x1024>' }

  if ENV['s3_bucket_name']
    has_attached_file :attachment,
                      :storage => :s3,
                      :path => ":basename:normalized_style.:extension",
                      :default_style => :original,
                      :bucket => ENV['s3_bucket_name'],
                      :s3_credentials => { :access_key_id => ENV['s3_access_id'], :secret_access_key => ENV['s3_secret_key'] },
                      :s3_headers => { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate },
                      :styles => STYLES
  else
    has_attached_file :attachment,
                      :storage => :filesystem,
                      :url => "/uploads/:basename:normalized_style.:extension",
                      :default_style => :original,
                      :styles => STYLES
  end

  Paperclip.interpolates :normalized_style do |attachment, style|
    "_#{style}" if attachment.instance.image? && style != :original
  end

  before_validation :download_remote_file, :if => :attachment_url_provided?

  validates_presence_of :attachment_file_name
  validates_presence_of :attachment_remote_url, :if => :attachment_url_provided?, :message => 'is invalid or inaccessible'
  validates_uniqueness_of :attachment_file_name

  before_post_process :image? # bypass image processing if not an image

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
  rescue # catch errors with validations
  end
end