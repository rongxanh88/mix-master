require 'rails_helper'

RSpec.describe Artist, type: :model do
  include Capybara::DSL

  before(:each) do
    Artist.create!(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  end


  it "tests the index page" do
    visit('/artists')
    expect(page).to have_current_path('/artists')
    expect(page).to have_content('Artist List')
    expect(page).to have_content('Bob Marley')
  end

  it "can add a new artist" do
    artist = "Taylor Swift"
    image_link = "http://cdn.newsapi.com.au/image/v1/26a2476dc344c27ac3e7670c9df711b2?width=650"

    visit('/artists')
    click_on('Create New Artist')
    expect(page).to have_current_path('/artists/new')

    fill_in('artist[name]', with: artist)
    fill_in('artist[image_path]', with: image_link)
    click_on('Create Artist')

    created_artist = Artist.find_by(name: artist)
    expect(page).to have_current_path("/artists")
    expect(page).to have_content(artist)
    expect(page).to have_content(image_link)
  end
end
