require 'spec_helper'

describe "Users" do
  context "homepage" do
    it "displays a link to show the sign up form" do
      visit root_path
      expect(page).to have_content("Sign Up")
    end

    # it "reveals sign up form when sign up link is clicked" do
    #   visit root_path
    #   click_link('Sign Up')
    #   page.should have_selector( '#sign-up-div', visible: true )
    # end

    # it "redirects to profile page after successful sign up" do
    #   visit root_path
    #   fill_in "Full Name", :with => "Ki Steiner"
    #   fill_in "Email", :with => "ki@ki.com"
    #   fill_in "Password", :with => "ki"
    #   click_button("Sign Up")
    #   expect(page).to have_content("Ki Steiner")
    # end
  end
end