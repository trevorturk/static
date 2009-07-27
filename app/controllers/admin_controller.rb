class AdminController < ApplicationController
  
  def index
    @pages = Page.all
    @settings = Setting.all
    @uploads = Upload.all(:order => 'attachment_content_type')
  end
  
end
