require 'rails_helper'

RSpec.describe Song, type: :model do
  xit "is a valid song" do 
    song = Song.new(title: "title", artist: "artist", user_id: 1)
    
    expect(song).to be_valid
  end
  
  it "can have tags" do
    song = Song.create(title: "title", artist: "artist", user_id: 1)
    song.tags.create(name: "rock")
    
    expect(song.tags.first.name).to eq("rock")
  end
end