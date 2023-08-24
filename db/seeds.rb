# create users sample data

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
second_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
User.create(name: 'Davied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student from Ethiopia.')

# create sample posts data
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my new post')
Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
Post.create(author: first_user, title: 'Hello', text: 'This is my second post')

# create sample comment data
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )