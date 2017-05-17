class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    binding.pry
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end
end