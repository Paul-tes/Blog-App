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

  
end
