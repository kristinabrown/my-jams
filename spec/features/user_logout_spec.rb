require 'rails_helper'

RSpec.describe "user logout" do 
  context "valid user" do
    it "logs out" do
      User.create(first_name: "first", 
                  last_name: "last", 
                  username: "testy", 
                  password: "password")
                  
      visit login_path
  
      fill_in "Username", with: "testy"
      fill_in "Password", with: "password"      
      click_button "Login"
      
      expect(page).to have_content("Welcome, first!")
      
      click_link_or_button "Logout"
      
      expect(page).to have_content("You successfully logged out.")
    end
  end
end