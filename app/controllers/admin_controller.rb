class AdminController < ApplicationController
  
  def index
    @pages = Page.all
    @settings = Setting.get
    @uploads = Upload.all(:order => 'attachment_content_type')
  end
  
  def settings
    @settings = Setting.first
    @settings.update_attributes(params[:setting])
    redirect_to admin_path
  end
  
end
