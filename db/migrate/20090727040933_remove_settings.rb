class RemoveSettings < ActiveRecord::Migration
  def self.up
    drop_table :settings
  end

  def self.down
    create_table :settings do |t|
      t.string :key
      t.text :value
      t.timestamps
    end
  end
end