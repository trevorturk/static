class PagesController < ApplicationController
  
  def show
    @page = Page.find_by_slug!(params[:id])
    render :action => 'show', :layout => 'custom'
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
      render :action => "new"
    end
  end
  
  def update
    @page = Page.find_by_slug!(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to admin_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @page = Page.find_by_slug!(params[:id])
    @page.destroy
    redirect_to admin_path
  end
  
  def home
    @page = Page.home
    render :action => 'show', :layout => 'custom'
  end
  
end
