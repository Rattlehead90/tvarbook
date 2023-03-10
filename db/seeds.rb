User.create(email: 'testuser1@examp.le', password: 'abcd1234', name: 'John', last_name: 'Paul', dob:'17/11/1997', country: 'cs')
User.create(email: 'testuser2@examp.le', password: 'abcd1234', name: 'Adam', last_name: 'Friedland', dob:'24/07/1986', country: 'en_US')
User.create(email: 'strogonov@seznam.cz', password: 'abcd1234', name: 'Vadim', last_name: 'Strogonov', dob: '17/11/1997', country: 'cs')

# Secondary test batch (scaling)
countries = ['cs', 'en_US', 'ru', 'uk', 'es', 'it', 'de', 'fr', 'en', 'pt']
20.times do |i|
  User.create(email: "secondarytestuser#{i}@examp.le", password: 'abcd1234', name: 'Test', last_name: 'User', dob: '04/01/2023', country: countries[i / 2 ])
end

Post.create(body: "Testing... ugh, well, it kinda works!", user_id: 3)
Post.create(body: "You’ve come a long way, congratulations! At this point, you should feel comfortable with building new Rails applications, modelling data, and working with forms. This project will require you to put all your newfound knowledge to the test. It should serve as a great portfolio piece for what you’re capable of. It’ll take some thought and time but it’s certainly within reach of your skills.", user_id: 1)
Post.create(body: "You’ll be building Facebook. As usual, any additional styling will be up to you but the really important stuff is to get the data and back end working properly. You’ll put together some of the core features of the platform – users, profiles, “friending”, posts, news feed, and “liking”. You’ll also implement sign-in with the real Facebook by using OmniAuth and Devise.", user_id: 2)


# Like tests
secondary_test_users = User.where(name: "Test")
secondary_test_users.each do |u|
  Like.create(reference_id: 1, reference_type: "Post", user_id: u.id )
end