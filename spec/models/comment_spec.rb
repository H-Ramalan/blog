require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.new(name: 'name', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', post_counter: 4) }
  before { user.save }
  let(:post) do
    Post.new(title: 'Hello', text: 'Good day', comments_counter: 4, likes_counter: 7, author_id: user.id)
  end
  before { post.save }
  let(:comment) { Comment.new(user_id: user.id, post_id: post.id, text: 'Hi Tom!') }
  before { comment.save }

  context 'when testing Comment class' do
    it 'should return the correct number of comment count' do
      count = comment.update_comment_count
      expect(count).to eq(1)
    end
  end
end