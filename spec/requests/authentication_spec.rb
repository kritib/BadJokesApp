require 'spec_helper'

describe "Authentication" do

  subject { page }

  context "when logged out" do
    before { visit 'root' }

    it { should have_button('Login') }
    it { should_not have_button('Logout') }
  end

  context "when logged in" do
    let!(:user) { FactoryGirl.create(:user) }
    before { login(user) }
    before { visit root_path }


    it { should have_button('Logout') }
    it { should_not have_button('Login') }
  end

end