require 'rails_helper'

RSpec.describe Artist, type: :model do

  before(:each) do
    Artist.create!(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  end

  describe "I can see the artist index page" do
    visit('/artists')
    expect(page).to have_current_path('/artists')
    expect(page).to have_content('Artist List')
    expect(page).to have_content('Bob Marley')
  end

  describe "I can add a new artist" do
    artist = "Taylor Swift"
    image_link = "http://cdn.newsapi.com.au/image/v1/26a2476dc344c27ac3e7670c9df711b2?width=650"

    visit('/artists')
    click_on('Create New Artist')
    expect(page).to have_current_path('/artists/new')

    fill_in('name', with: artist)
    fill_in('image_path', with: image_link)
    click_on('Create Artist')

    expect(page).to have_current_path('/artists/2')
    expect(page).to have_content(artist)
    expect(page).to have_css("img[src=\"#{image_link}\"]")
  end
end
