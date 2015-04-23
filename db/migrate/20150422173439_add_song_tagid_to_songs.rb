class AddSongTagidToSongs < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end
    
    create_table :song_tags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :song, index: true
    end
  end
end
