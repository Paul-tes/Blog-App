class Comment < ActiveRecord::Base
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_comment_count

  private

  def update_comment_count
    post.increment!(comments_counter)
  end
end
