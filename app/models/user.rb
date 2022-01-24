class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  def three_recent_user
    User.limit(3).order(created_at: :asc)
  end
end
