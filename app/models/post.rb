class Post < ApplicationRecord
  #Relationship
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'
end
