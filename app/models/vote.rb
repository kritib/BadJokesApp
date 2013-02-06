class Vote < ActiveRecord::Base
  attr_accessible :joke_id, :user_id, :score

  belongs_to :joke
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :joke_id},
                      :presence => true
  validates :score, :inclusion => { :in => [1, -1] },
            :presence => true
  validates :joke_id, :presence => true
end

