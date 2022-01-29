class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  after_save :comments_counter_for_post

  def comments_counter_for_post
    post.increment!(:commentscounter)
  end
end
