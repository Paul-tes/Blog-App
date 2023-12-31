class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :asc)
  end
end
