require 'rails_helper'

RSpec.describe Playlist, type: :model do
  include Capybara::DSL

  before(:each) do
    artist = create(:artist)
    artist.songs.create!(title: "Hello")
    artist.songs.create!(title: "World")
    artist.songs.create!(title: "Blah!")
  end

  # As a user
  # Given that songs and artists exist in the database
  # When I visit the playlists path
  # And I click "New playlist"
  # And I fill in a name
  # And I select the songs for the playlist
  # And I click "Create Playlist"
  # Then I see the playlist title
  # And I see the titles of all songs in that playlist
  # And the titles should link to the individual song pages

  it "visits index of playlists" do
    visit('/playlists')
    expect(page).to have_current_path('/playlists')
    expect(page).to have_content('Music Playlists')
  end

  it "allows me to create a new playlist" do
    visit('/playlists')
    click_on('Create New Playlist')
  end

  it "does not allow me to create an empty playlist" do

  end

  it "allows me to go to individual song pages" do

  end
end

RSpec.describe Playlist, "associations", type: :model do
  it { should have_many(:playlist_songs)}
  it { should have_many(:songs).through(:playlist_songs) }
end