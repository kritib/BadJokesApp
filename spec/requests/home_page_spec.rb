require 'spec_helper'

describe "Home page" do
  let!(:joke) { FactoryGirl.create(:joke) }
  let!(:user) { FactoryGirl.create(:user) }
  before { login(user) }
  before { visit '/' }

  it "should have the title of jokes" do
    page.should have_selector('title',
                              :text => "Them be jokes")
  end


  it "should list the content of submitted jokes" do
    page.should have_content(joke.body)
  end

  it "should allow users to vote for jokes" do
    expect do
      click_button "+"
    end.to change(joke, :score).by(1)
  end

  it "should not allow users to upvote the same joke twice" do
    expect do
      click_button "+"
      click_button "+"
    end.to change(joke, :score).by(1)
  end

  it "should allow users to change their vote" do
    expect do
      click_button "+"
      click_button "-"
    end.not_to change(joke, :score)
  end

end