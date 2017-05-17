require 'rails_helper'

RSpec.describe Song, type: :model do
  include Capybara::DSL

  before(:each) do
    artist = Artist.create!(
      name: "Bob Marley",
      image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
      )

    artist.songs.create!(title:"Hello")
    artist.songs.create!(title:"World")
    artist.songs.create!(title:"Anybody?")
  end

  it "I can see songs index for an artist" do
    artist = Artist.first
    visit('/artists')
    click_on("Bob Marley")

    expect(page).to have_content(artist.songs.first.title)
    expect(page).to have_content(artist.songs.last.title)
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

    visit('/artists')
    click_on(artist.name)
    
    expect(page).to have_content(artist.songs.first.title)
    expect(page).to have_content(artist.songs.last.title)
  end
end
