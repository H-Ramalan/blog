class Like < ApplicationRecord
  # Relationship
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
    post.likes.count
  end
end
