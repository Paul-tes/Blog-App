require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'David', photo: 'https://somepic.potraits/5158', bio: 'Developer')
    @user2 = User.create(name: 'Bill Gates', photo: 'https://somepic.potraits/5158', bio: 'Developer')
    @first_post = Post.create(author: @user, title: 'Hello, one', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello, two', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello, three', text: 'This is my third post')
    @last_post = Post.create(author: @user, title: 'Hello, four', text: 'This is my last post')
    @comment1 = Comment.create(post: @last_post, author: @user2, text: 'This is the 1st comment on the last post')
    @comment2 = Comment.create(post: @last_post, author: @user2, text: 'This is the 2nd comment on the last post')
    @comment3 = Comment.create(post: @last_post, author: @user2, text: 'This is the 3rd comment on the last post')
  end

  describe 'post#show' do
    before(:each) do
      visit user_post_path(@user, @last_post)
    end
    it 'should show who is the writer of the post\'s' do
      expect(page).to have_content(@last_post.title)
    end

    it 'how many comments a post has.' do
      expect(page).to have_content("Comments: #{@last_post.comments_counter}")
    end

    it 'how many likes a post has' do
      expect(page).to have_content("Likes: #{@last_post.likes_counter}")
    end

    it 'should some of the posts body' do
      expect(page).to have_content(@last_post.text)
    end

    it "should show the comment's author" do
      expect(page).to have_content(@comment1.author.name)
      expect(page).to have_content(@comment2.author.name)
      expect(page).to have_content(@comment3.author.name)
    end

    it "should show the comment's for each user" do
      @user2.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
