class AddPagesBody < ActiveRecord::Migration
  def self.up
    add_column :pages, :body_html, :text
  end

  def self.down
    remove_column :pages, :body_html
  end
end
