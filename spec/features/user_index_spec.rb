require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'Tom', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Europe')
    @user2 = User.create(name: 'Lilly', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from America')
  end

  it 'displays the username of all other users' do
    visit users_path
    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Hamza')
  end

  it 'displays the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='#{@user1.photo}']")
    expect(page).to have_css("img[src*='#{@user2.photo}']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content('Number of posts: 3')
  end

  it "redirects to a user's show page when clicking on a user" do
    visit users_path
    expect(page).to have_current_path(users_path)
    click_link(@user2.name)
  end
end
