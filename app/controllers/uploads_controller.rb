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
  rescue Errno::EROFS
    render :text => "Heroku has a read-only filesystem. Have you enabled S3 support? Please review the README."  
  end
  
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to admin_path
  end
  
end
