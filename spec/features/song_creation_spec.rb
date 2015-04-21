require 'rails_helper'

RSpec.describe 'user creates a song' do #situation
  context 'with valid attributes' do  #constraints
    it 'saves and displays song title' do #outcome
      
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
      
      visit new_song_path
      fill_in "song[title]", with: "My Song"
      fill_in "song[artist]", with: "Mary J Blige"
      click_link_or_button "Create Song"

      expect(page).to have_content("My Song")
      expect(page).to have_content("Mary J Blige")
    end
  end
end