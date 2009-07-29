class SettingsAddPasswordChangeThemeToLayout < ActiveRecord::Migration
  def self.up
    add_column :settings, :password, :string
    rename_column :settings, :theme, :layout
  end

  def self.down
    remove_column :settings, :password
    rename_column :settings, :layout, :theme
  end
end
