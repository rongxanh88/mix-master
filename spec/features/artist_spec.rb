require 'rails_helper'

RSpec.feature "Artist Navigation" do
  include Capybara::DSL

  before(:each) do
    create(:artist)
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:image_path)}
    it { is_expected.to validate_uniqueness_of(:name)}
  end


  it "tests the index page" do
    artist1, artist2, artist3 = create_list(:artist, 3)

    visit('/artists')
    expect(page).to have_current_path('/artists')
    expect(page).to have_content('Artist List')
    expect(page).to have_content('Bob Marley')
    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)
    expect(page).to have_content(artist3.name)
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
    expect(page).to have_current_path("/artists/#{created_artist.id}")
    expect(page).to have_content(artist)
    expect(page).to have_content(image_link)
  end

  it "gets error when entering no name" do
    image_link = "http://cdn.newsapi.com.au/image/v1/26a2476dc344c27ac3e7670c9df711b2?width=650"

    visit('/artists')
    click_on('Create New Artist')

    fill_in('artist[image_path]', with: image_link)
    click_on('Create Artist')

    expect(page).to have_content("Name can't be blank")
  end

  it "shows an artist's individual page" do
    artist = Artist.last

    visit('/artists')
    click_on(artist.name)

    expect(page).to have_content(artist.name)
    expect(page).to have_content(artist.image_path)
  end

  it "edits an artist" do
    artist = Artist.last

    visit('/artists')
    click_on(artist.name)
    expect(page).to have_current_path("/artists/#{artist.id}")
    click_on("Edit Artist")
    fill_in("artist[name]", with: "Famous Person")
    fill_in("artist[image_path]", with: "http://www.image.com/famous")
    click_on('Update Artist')
    
    expect(page).to have_current_path("/artists/#{artist.id}")
    expect(page).to have_content("Famous Person")
    expect(page).to have_content("http://www.image.com/famous")
  end

  it "deletes an artist" do
    artist = Artist.last

    visit('/artists')
    click_on(artist.name)
    click_on("Delete")

    expect(page).to have_current_path("/artists")
    expect(page).not_to have_content(artist.name)
  end
end
