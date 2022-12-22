# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'testuser1@examp.le', password: 'abcd1234', name: 'John', last_name: 'Paul', dob:'17/11/1997', country: 'CZE')
User.create(email: 'testuser2@examp.le', password: 'abcd1234', name: 'Adam', last_name: 'Friedland', dob:'24/07/1986', country: 'USA')
User.create(email: 'strogonov@seznam.cz', password: 'abcd1234', name: 'Vadim', last_name: 'Strogonov', dob: '17/11/1997', country: 'CZE')

Post.create(body: "You’ve come a long way, congratulations! At this point, you should feel comfortable with building new Rails applications, modelling data, and working with forms. This project will require you to put all your newfound knowledge to the test. It should serve as a great portfolio piece for what you’re capable of. It’ll take some thought and time but it’s certainly within reach of your skills.", user_id: 1)
Post.create(body: "You’ll be building Facebook. As usual, any additional styling will be up to you but the really important stuff is to get the data and back end working properly. You’ll put together some of the core features of the platform – users, profiles, “friending”, posts, news feed, and “liking”. You’ll also implement sign-in with the real Facebook by using OmniAuth and Devise.", user_id: 2)