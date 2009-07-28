class RemovePagesBodyHtml < ActiveRecord::Migration
  def self.up
    remove_column :pages, :body_html
  end

  def self.down
    add_column :pages, :body_html, :text
  end
end
