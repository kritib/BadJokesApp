require 'spec_helper'

describe Joke do
  before { @joke = Joke.new(user_id: 1, body: "Har") }

  subject { @joke }

  it { should respond_to(:body) }
  it { should respond_to(:score) }
  it { should respond_to(:user) }
end
