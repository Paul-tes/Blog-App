require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'David',
                        photo: 'https://somepic.potraits/5158',
                        bio: 'Developer')
    @user2 = User.create(name: 'Bill Gates',
                         photo: 'https://somepic.potraits/5158',
                         bio: 'Developer')
    @first_post = Post.create(author: @user, title: 'Hello, one', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello, two', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello, three', text: 'This is my third post')
    @last_post = Post.create(author: @user, title: 'Hello, four', text: 'This is my last post')
    @comment1 = Comment.create(post: @last_post, author: @user2, text: 'This is the 1st comment on the last post')
    @comment2 = Comment.create(post: @last_post, author: @user2, text: 'This is the 2nd comment on the last post')
    @comment3 = Comment.create(post: @last_post, author: @user2, text: 'This is the 3rd comment on the last post')
  end

  describe 'post#index' do
    before(:each) do
      visit user_posts_path(@user)
    end
    it 'should show username for a user' do
      expect(page).to have_content('David')
    end

    it "should show user's profile picture" do
      expect(page.body).to include('https://somepic.potraits/5158')
    end

    it 'should show the number of posts for each user' do
      expect(page).to have_content('Number of posts: 4')
    end

    it "should show the post's title" do
      expect(page).to have_content('Hello, one')
      expect(page).to have_content('Hello, two')
      expect(page).to have_content('Hello, three')
    end
end
  
end

