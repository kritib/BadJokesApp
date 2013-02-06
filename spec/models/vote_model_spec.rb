require 'spec_helper'

describe Vote do

  # before { @user = User.new(username: "blah") }
  before { @vote = Vote.create(user_id: 1, joke_id: 1, score: 1) }

  subject { @vote }

  it { should respond_to(:joke) }
  it { should respond_to(:user) }



  it "should not allow bogus votes" do
    scores = [nil, -2, 2, 0]

    scores.each do |score|
      @vote.score = score
      @vote.should_not be_valid
    end
  end

  it "should allow positive and negative votes" do
    scores = [1, -1]

    scores.each do |score|
      @vote.score = score
      @vote.should be_valid
    end
  end

  it "should only allow each user to vote on a joke once" do
    vote_dup = @vote.dup
    vote_dup.should_not be_valid
  end

end
