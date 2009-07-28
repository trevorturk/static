class UploadsController < ApplicationController
  
  def new
    @upload = Upload.new
  end
  
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      redirect_to admin_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to admin_path
  end
  
end
