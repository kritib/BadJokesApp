class User < ActiveRecord::Base
  attr_accessible :username

  has_many :jokes

  has_many :votes

  has_many :fan_relationships, :class_name => "Relationship",
           :foreign_key => :hero_id
  has_many :fans, :through => :fan_relationships

  has_many :hero_relationships, :class_name => "Relationship", 
           :foreign_key => :fan_id
  has_many :heroes, :through => :hero_relationships

  validates :username, :presence => true

  def refresh_token
    token = SecureRandom.base64
    self.update_attribute(:session_token, token)
  end

#   has_many :relationships

#   has_many :fans, :through => :relationships, :source => :hero_id
#   has_many :heroes, :through => :relationships, :source => :fan_id
end
