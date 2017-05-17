class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.create!(playlist_params)
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end
