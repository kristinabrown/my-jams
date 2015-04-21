require 'rails_helper'

RSpec.describe "user login" do
  context "with valid attributes" do
    it "arrives at their dashboard" do
      visit new_user_path
      
      fill_in "First name", with: "first"
      fill_in "Last name", with: "last"
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create user"
      
      expect(page).to have_content("Welcome, first!")
      
      visit login_path
  
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"      
      click_button "Login"
      
      expect(page).to have_content("Welcome, first!")
    end
  end
  
  context "with invalid attributes" do
    it "gets error about invalid login" do
      visit new_user_path
      
      fill_in "First name", with: "first"
      fill_in "Last name", with: "last"
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create user"
      
      expect(page).to have_content("Welcome, first!")
      
      visit login_path
  
      fill_in "Username", with: "testy"
      fill_in "Password", with: "password"      
      click_button "Login"
      
      expect(page).to have_content("invalid login")
    end
  end
end