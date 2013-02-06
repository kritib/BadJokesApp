require 'spec_helper'

describe User do
  before { @user = User.new(username: "blah") }
  before { @user.refresh_token }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:fans) }
  it { should respond_to(:heroes) }
  it { should respond_to(:jokes) }
  it { should respond_to(:session_token) }

  it "must have a username" do
    bad_user = User.new
    bad_user.should_not be_valid
  end


end
