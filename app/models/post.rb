class Post < ApplicationRecord
  # Relationship
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', dependent: :destroy
  has_many :likes, class_name: 'Like', dependent: :destroy

  private

  def update_post_counter
    user.update(post_counter: user.posts.count)
  end


  public

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end

  # VALIDATIONS
  validates :title, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
