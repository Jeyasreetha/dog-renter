# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Renting.destroy_all
Dog.destroy_all
User.destroy_all

puts 'Creating 10 fake users and dogs'
10.times do
   user = User.new(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
   )
   user.save!
# puts 'Now creating 10 fake dogs'
    dog = Dog.new(
    user: user,
    name: Faker::Dessert.flavor,
    age: Faker::Number.within(range: 1..10),
    breed: Faker::Food.fruits,
    price: Faker::Number.within(range: 5..100),
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}"
  )
  dog.save!
end
puts 'Finished creating 10 fake users and dogs'


