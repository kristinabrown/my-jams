class SongsController < ApplicationController
  def index
    @songs = current_user.songs
    session[:hitcounter] ||= 0
    session[:hitcounter] += 1
  end
  
  def show
    @song = current_user.songs.find(params[:id])
  end
  
  def new
    @song = current_user.songs.new
    @tags = Tag.all
  end
  
  def create
    @song = current_user.songs.new(song_params)
    tags = params[:song][:tag_ids].reject(&:empty?)
    if @song.save
      tags.each { |tag| @song.tags << Tag.find(tag) }
      flash[:notice] = "Song successfully saved!"
      redirect_to song_path(@song)
    else
      flash[:errors] = @song.errors.full_messages.join(', ')
      render :new 
    end
  end
  
  def edit
    @song = current_user.songs.find(params[:id])
    @tags = Tag.all
  end
  
  def update
   @song = current_user.songs.find(params[:id])
   tags = params[:song][:tag_ids].reject(&:empty?)
   if @song.update(song_params)
     @song.tags.destroy_all
     tags.each { |tag| @song.tags << Tag.find(tag) }
     redirect_to song_path(@song)
   else
     render :edit
   end
  end
  
  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end
  
  private
  
  def song_params
    params.require(:song).permit(:title, :artist, :user_id, :tag_ids)
  end
  
end