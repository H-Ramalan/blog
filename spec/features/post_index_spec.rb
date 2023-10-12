require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create(name: 'Tom', photo: 'https://picsum.photos/id/64/200', bio: 'Teacher from Mexico', post_counter: 0)
    end
    let!(:post) { Post.create(user:, title: 'first ever post', text: 'this my post for the first time', author_id: 1) }
    let!(:comment1) { Comment.create(user:, post:, text: 'Hi Tom', user_id: 1) }
    let!(:comment2) { Comment.create(user:, post:, text: 'Hi Tom', user_id: 1) }
    let!(:like1) { Like.create(user:, post:, user_id: 1) }
    before do
      visit user_posts_path(user_id: 1)
    end
    it "shows the user's profile picture" do
      expect(page).to have_selector("img[src*='#{user.photo}']")
    end
    it "shows the user's username" do
      expect(page).to have_content("name: #{user.name}")
    end
    it 'shows the number of posts the user has written' do
      expect(page).to have_content('number of posts: 5')
    end
    it "shows a post's title" do
      expect(page).to have_content('Post # 370')
    end
    it "shows the post's body" do
      expect(page).to have_content('This is my first post')
    end
    it 'shows the first comments on a post' do
      expect(page).to have_content("comment: #{comment1.text}")
      expect(page).to have_content("comment: #{comment2.text}")
    end
    it 'shows  how many comments a post has' do
      expect(page).to have_content('Comments: 2')
    end
    it 'shows how many likes it has' do
      expect(page).to have_content('Likes: 1')
    end
    it 'shows a section for pagination if there are more posts than fit on the view' do
      user = User.first
      post_count = user.posts.count
      if post_count > 3
        expect(page).to have_selector('.pagination')
      else
        expect(page).not_to have_selector('.pagination')
      end
    end
    it "When I click on a post, it redirects me to that post's show page" do
      click_on('This is my first post')
      expect(current_path).to eq(user_post_path(1, 370))
    end
  end
end
