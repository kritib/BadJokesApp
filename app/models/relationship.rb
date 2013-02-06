class Relationship < ActiveRecord::Base
  attr_accessible :fan_id, :hero_id

  belongs_to :fan, :class_name => "User"
  belongs_to :hero, :class_name => "User"

  validates :fan_id, :uniqueness => { :scope => :hero_id }
  validates :fan_id, :hero_id, :presence => true
end
