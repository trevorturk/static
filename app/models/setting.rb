class Setting < ActiveRecord::Base
  
  attr_accessible :key, :value
  
  validates_presence_of :key, :value
  validates_uniqueness_of :key
  
  def self.get(key)
    Setting.all.select {|s| s.key == key}.first.value rescue nil
  end
  
end
