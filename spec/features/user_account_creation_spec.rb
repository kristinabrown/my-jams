require 'rails_helper'

RSpec.describe "user account creation" do
  context "with valid attributes" do
    it "creates an account" do
      visit new_user_path
      
      fill_in "First name", with: "first"
      fill_in "Last name", with: "last"
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create user"
      
      expect(page).to have_content("Welcome, first!")
    end
  end
  
  context "with invalid attributes" do
    it "gives an error when username is not given" do
      visit new_user_path
      fill_in "First name", with: "first"
      fill_in "Last name", with: "last"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create user"
      
      expect(page).to have_content("Username can't be blank")
    end
  end

  context "with repeat username" do
    it "gives an error when username is repeated" do
      2.times do
      visit new_user_path
        fill_in "First name", with: "first"
        fill_in "Last name", with: "last"
        fill_in "Username", with: "username"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_link_or_button "Create user"
      end
      
      expect(page).to have_content("Username has already been taken")
    end
  end
end