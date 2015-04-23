class Song < ActiveRecord::Base
  belongs_to :user
  has_many :song_tags
  has_many :tags, through: :song_tags 
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
end
