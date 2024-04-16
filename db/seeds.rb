# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create!(first_name: 'Shahzad', last_name: 'Tariq', score: 24,dob: '01-01-1989', status: 'active')
User.create!(first_name: 'Shahroon', last_name: 'Khan', score: 77, dob: '01-01-1955', status: 'active')
User.create!(first_name: 'Wasif', last_name: 'Peer', score: 46, dob: '01-01-1985', status: 'active')