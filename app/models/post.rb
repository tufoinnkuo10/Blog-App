class Post < ApplicationRecord
  belongs_to :users
  has_many :likes, :comments

  def update_post_counter
    users.postcounter += 1
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
