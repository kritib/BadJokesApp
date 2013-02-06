class Joke < ActiveRecord::Base
  attr_accessible :body, :user_id

  belongs_to :user
  has_many :votes

  validates :body, :user_id, :presence => true

  def score
    votes.select("SUM(score) AS joke_score").first.joke_score
  end
end
