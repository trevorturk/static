class ChangeSettingsPasswordToPasswordHash < ActiveRecord::Migration
  def self.up
    rename_column :settings, :password, :password_hash
  end

  def self.down
    rename_column :settings, :password_hash, :password
  end
end
