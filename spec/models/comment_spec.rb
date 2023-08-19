require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Paul', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.')
    @post = Post.new(author: @author, title: 'My 1st blog', text: 'This is my first blog post')
    @comment = Comment.create(post: @post, author: @author, text: 'Hi Tom!')
  end

  describe '[ Association ]' do
    it { should belong_to(:post).class_name('Post').with_foreign_key('post_id') }
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
  end

  describe '# -> update_comments_count' do
    it 'should increment the amount of comments' do
      @comment.update_comments_count
      expect(@post.comments_counter).to eq 2
    end
  end
end
