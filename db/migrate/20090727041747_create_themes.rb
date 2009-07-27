class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :themes
  end
end
