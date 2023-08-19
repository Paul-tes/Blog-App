require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.new(name: 'Abel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.')
    @post = Post.new(author: @author, title: 'My 1st blog', text: 'This is my first blog post')
    @like = Like.new(author: @author, post: @post)
  end

  describe '[ Association ]' do
    it { should belong_to(:post).class_name('Post').with_foreign_key('post_id') }
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
  end

  describe '# -> update_likes_count' do
    it 'should increment the number of likes' do
      @like.update_likes_count
      expect(@post.likes_counter).to eq 1
    end
  end
end
