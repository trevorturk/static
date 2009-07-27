class AdminController < ApplicationController
  
  def index
    @pages = Page.all
    @theme = Theme.get
    @uploads = Upload.all(:order => 'attachment_content_type')
  end
  
  def theme
    @theme = Theme.first
    @theme.update_attributes(params[:theme])
    redirect_to admin_path
  end
  
end
