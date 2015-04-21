require 'rails_helper'

RSpec.describe 'user creates a song' do #situation
  context 'with valid attributes' do  #constraints
    it 'saves and displays song title' do #outcome
      visit new_song_path
      fill_in "song[title]", with: "My Song"
      fill_in "song[artist]", with: "Mary J Blige"
      click_link_or_button "Create Song"

      expect(page).to have_content("My Song")
      expect(page).to have_content("Mary J Blige")
    end
  end
end