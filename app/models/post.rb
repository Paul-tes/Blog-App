class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, class_name: 'Like', foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  after_save :update_user_posts_counter

  def recent_comment
    comments.limit(5).order(created_at: :asc)
  end

  private

  def update_user_posts_counter
    author.increment!(posts_counter)
  end
end
