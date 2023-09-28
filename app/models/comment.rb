class Comment < ApplicationRecord
  #Relationship
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  
  def update_comment_count
    post.update(comments_counter: post.comments.count)
  end
end
