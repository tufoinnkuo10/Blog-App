class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  def three_recent_user_post
    posts.limit(3).order(created_at: :desc)
  end
end
