class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :postcounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_user
    User.limit(3).order(created_at: :desc)
  end
end
