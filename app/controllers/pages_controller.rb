class PagesController < ApplicationController
  
  def index
    @pages = Page.all
  end
  
  def show
    @page = Page.find_by_slug!(params[:id])
    render :action => 'show', :layout => set_layout
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
      redirect_to slug_path(@page.slug)
    else
      render :action => "new"
    end
  end
  
  def update
    @page = Page.find_by_slug!(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to slug_path(@page.slug)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @page = Page.find_by_slug!(params[:id])
    @page.destroy
    redirect_to root_path
  end
  
  def home
    @page = Page.home
    render :action => 'show', :layout => set_layout
  end
  
  private
  
  def set_layout
    Setting.get('layout') ? 'custom' : 'application'
  end
  
end
