class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, length: { maximum: 250, minimum: 2 }, presence: true
  validates :text, presence: true
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :post_counter_for_user

  def post_counter_for_user
    user.increment!(:postcounter)
  end

  def five_recent_comments()
    Post.comments.limit(5)
  end
end
