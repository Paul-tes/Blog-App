require 'rails_helper'

RSpec.describe User, type: :model do
  describe ' ()=> validation' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe ' ()=> associations' do
    it { should have_many(:comments).class_name('Comment').with_foreign_key('author_id') }
    it { should have_many(:posts).class_name('Post').with_foreign_key('author_id') }
    it { should have_many(:likes).class_name('Like').with_foreign_key('author_id') }
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts in descending order' do
      user = User.create(name: 'John Doe')
      4.times { |num| Post.create(author: user, title: 'Hello', text: "This is post No: #{num + 1}") }
      expect(user.recent_posts.length).to eq(3)
      expect(user.recent_posts.first.text).to eq('This is post No: 4')
    end
  end
end
