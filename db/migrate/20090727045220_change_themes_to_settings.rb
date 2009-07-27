class ChangeThemesToSettings < ActiveRecord::Migration
  def self.up
    rename_table :themes, :settings
    rename_column :settings, :body, :theme
    remove_column :settings, :created_at
    remove_column :settings, :updated_at
  end

  def self.down
    add_column :settings, :created_at, :datetime
    add_column :settings, :updated_at, :datetime
    rename_table :settings, :themes
    rename_column :settings, :theme, :body
  end
end
