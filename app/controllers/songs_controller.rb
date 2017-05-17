class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:song][:artist_id])
    @song = artist.songs.create!(song_params)
    redirect_to artist_path(@song.artist)
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end
