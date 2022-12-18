# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'testuser1@examp.le', password: 'abcd1234', name: 'John', last_name: 'Paul', dob:'17/11/1997', country: 'CZE')
User.create(email: 'testuser2@examp.le', password: 'abcd1234', name: 'Adam', last_name: 'Friedland', dob:'24/07/1986', country: 'USA')