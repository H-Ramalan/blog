require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  describe 'show page' do
    let(:user) { User.create(name: 'Tom', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico', post_counter: 0) }
    let!(:post1) { Post.create(user:, title: 'Post 1', text: 'This is my first post', author_id: user.id) }
    let!(:post2) { Post.create(user:, title: 'Post 2', text: 'This is my second post', author_id: user.id) }
    let!(:post3) { Post.create(user:, title: 'Post 3', text: 'This is my third post', author_id: user.id) }

    before do
      visit user_path(user)
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
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end

    it "shows a button that lets me view all of a user's posts" do
      expect(page).to have_content('See All Post')
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      click_link("title: #{post1.title}")
      expect(current_path).to eq(user_post_path(user, post1))
    end
  end
end
