# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [
  {name: 'Subway', category: 'Sandwiches', last_visited: Date.parse('1/1/2017')},
  {name: 'Jimmy Johns', category: 'Sandwiches', last_visited: Date.parse('2/1/2017')},
  {name: 'Nan Thai', category: 'Thai', last_visited: Date.parse('25/1/2017')},
  {name: 'Antico', category: 'Pizza', last_visited: Date.parse('30/12/2016')},
  {name: 'Lure', category: 'Seafood', last_visited: Date.parse('22/12/2016')},
  {name: 'Rosa Mexicano', category: 'Mexican', last_visited: Date.parse('28/11/2016')}
]

restaurants.each do |restaurant|
  Restaurant.create(restaurant)
end