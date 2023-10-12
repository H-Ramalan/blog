require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  describe 'show page' do
    let(:user) { User.create(name: 'Tom', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico', post_counter: 0) }
    let!(:post1) { Post.create(user:, title: 'Post 1', text: 'This is my first post', author_id: 1) }
    let!(:post2) { Post.create(user:, title: 'Post 2', text: 'This is my second post', author_id: 1) }
    let!(:post3) { Post.create(user:, title: 'Post 3', text: 'Third post', author_id: 1) }
    let!(:post4) { Post.create(user:, title: 'Post 4', text: 'New post', author_id: 1) }


    before do
      visit user_path(1)
    end

    it "shows the user's profile picture" do
      expect(page).to have_css("img[src*='#{user.photo}']")
    end

    it "shows the user's username" do
      expect(page).to have_content(user.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content(user.post_counter)
    end

    it "shows the user's bio" do
      expect(page).to have_content('Bio')
      expect(page).to have_content('Teacher from Mexico')
    end

    it "shows the user's first 3 posts" do
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('First post from Lilly')
      expect(page).to have_content('Third post')
    end

    it "shows a button that lets me view all of a user's posts" do
      expect(page).to have_button('See all posts')
    end

    it 'redirects me to user\'s posts index when i click on "See  all posts" button' do
      click_link('See all posts')
      expect(current_path).to eq(user_posts_path(user_id: 1))
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      click_link('First post from Lilly')
      expect(current_path).to eq(user_post_path(1, 371))
    end
  end
end
