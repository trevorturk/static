class PagesController < ApplicationController

  skip_before_filter :authenticate, :only => :show

  def index
    @pages = Page.all(:order => 'slug')
    @uploads = Upload.all(:order => 'attachment_file_name')
  end

  def show
    @page = Page.find_by_slug!(params[:id])
    render 'show', :layout => 'custom'
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find_by_slug!(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to admin_path
    else
      render :action => 'new'
    end
  end

  def update
    @page = Page.find_by_slug!(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to admin_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find_by_slug!(params[:id])
    @page.destroy
    redirect_to admin_path
  end
end