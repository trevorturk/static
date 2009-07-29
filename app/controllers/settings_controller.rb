class SettingsController < ApplicationController
  
  def update
    Setting.get.update_attributes(params[:setting])
    redirect_to admin_path
  end
  
end
