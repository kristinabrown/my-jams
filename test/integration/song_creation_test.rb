require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  
  test "user can create a song" do
    visit new_song_path
    fill_in "song[title]", with: "My Song"
    fill_in "song[artist]", with: "Mary J Blige"
    click_link_or_button "Create Song"

    assert page.has_content?("My Song")
    assert page.has_content?("Mary J Blige")
  end
end