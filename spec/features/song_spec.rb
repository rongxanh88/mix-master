require 'rails_helper'

RSpec.features "Song Navigation" do
  include Capybara::DSL

  before(:each) do
    Artist.create!(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    song1, song2, song3 = create_list(:song, 3)
  end

  describe "I can see songs index for an artist" do
    visit('/artists')
    click_on("Bob Marley")

    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to have_content(song3.title)
  end

  describe "I can add a new song" do
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
end
