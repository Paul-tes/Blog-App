require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:each) do
    @user = User.create(name: 'David',
                        photo: 'https://somepic.potraits/5158',
                        bio: 'Developer')
    @first_post = Post.create(author: @user, title: 'Hello, one', text: 'This is my first post')
    @second_post = Post.create(author: @user, title: 'Hello, two', text: 'This is my second post')
    @third_post = Post.create(author: @user, title: 'Hello, three', text: 'This is my third post')
    @last_post = Post.create(author: @user, title: 'Hello, four', text: 'This is my last post')
  end

  describe 'user#show' do
    before(:each) do
      visit user_path(@user)
    end
    it "should show the user's profile picture" do
      expect(page.body).to include('https://somepic.potraits/5158')
    end
    it 'should show username' do
      expect(page).to have_content('David')
    end

    it 'should show the number of posts the user' do
      expect(page).to have_content('Number of posts: 4')
    end

    it "should show the user's bio" do
      expect(page).to have_content('Developer')
    end

    it "should show the user's first 3 posts" do
      expect(page).to have_content('Hello, one')
      expect(page).to have_content('Hello, two')
      expect(page).to have_content('Hello, three')
      expect(page).to have_no_content('Hello, four')
    end

    it 'should render see all posts button' do
      expect(page).to have_content('See all posts')
    end

    it "should redirect to that post's show page when see all posts button is clicked" do
      click_link('See all posts')
      expect(page).to have_content('Pagination')
    end

    it 'should redirect to the user posts page when the post title is clicked' do
      click_link(@first_post.title)
      expect(current_path).to eq(user_post_path(@user, @first_post))
    end
  end
end
