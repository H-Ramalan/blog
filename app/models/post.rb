class Post < ApplicationRecord
  # Relationship
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'

  after_save :update_post_counter

  private

  def update_post_counter
    user.update(post_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end
end
