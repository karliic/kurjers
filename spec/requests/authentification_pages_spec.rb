require 'spec_helper'

describe "Authentification" do
  
  subject { page }

  describe "signin page" do
  	before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in')  }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

     # it { should have_selector('title', text: 'Sign in') }
     # it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in "Email",    with: admin.email.upcase
        fill_in "Password", with: admin.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: admin.name) }
      it { should have_link('Profile', href: admin_path(admin)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
