require 'rails_helper'

RSpec.feature "Song Navigation" do
  include Capybara::DSL

  before(:each) do
    create(:artist)

    song1, song2, song3 = create_list(:song, 3)
  end

  it "I can see songs index for an artist" do
    visit('/artists')
    click_on("Bob Marley")

    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to have_content(song3.title)
  end

  it "I can add a new song" do
    artist = Artist.find_by_name("Bob Marley")

    visit('/artists')
    click_on(artist.name)
    click_on("New Song")
    fill_in("song[title]", with: "Just another high day.")
    click_on("Create Song")

    song = Song.find_by_title("Just another high day.")

    expect(page).to have_current_path("/songs/#{song.id}")
    expect(page).to have_content("Just another high day.")
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  it "I can view all songs by artist" do
    artist = Artist.first
    song1, song2, song3 = create_list(:song, 3)

    visit('/artists')
    click_on(artist.name)
    
    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to have_content(song3.title)
  end
end
