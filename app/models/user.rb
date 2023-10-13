class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Reletionship
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'user_id', dependent: :destroy

  after_initialize :set_default_post_counter

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  # VALIDATIONS
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def set_default_post_counter
    self.post_counter ||= 0
  end
end
