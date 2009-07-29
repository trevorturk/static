class SettingsController < ApplicationController
  
  def update
    Setting.first.update_attributes(params[:setting])
    redirect_to admin_path
  end
  
end
