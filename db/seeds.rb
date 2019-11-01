# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# (order matters according to association) renting belong to a dog
Renting.destroy_all
# a dog belongs to a user
Dog.destroy_all
User.destroy_all

puts 'creating user'

user = User.new(name: 'Olga', email: 'olga@gmail.com', location: "Canguu", password: "password")
user.save

user = User.new(name: 'Jesh', email: 'jesh@gmail.com', location: "Seminjak" , password: "password")
user.save


puts 'users created'

puts 'Creating dogs'

url = "https://images.pexels.com/photos/133069/pexels-photo-133069.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Spotty', age: "1", price: "15", location: "Berawa", user_id: User.all.sample.id, breed: "French Bulldog")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/57627/pexels-photo-57627.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Bruno', age: "5", price: "10", location: "Canggu", user_id: User.all.sample.id, breed: "Poodle")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/1322182/pexels-photo-1322182.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Jane', age: "1", price: "34", location: "Seminjak", user_id: User.all.sample.id, breed: "Australian Shepherd")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/1805165/pexels-photo-1805165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Heroku', age: "3", price: "22", location: "Canggu", user_id: User.all.sample.id, breed: "Labrador")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/776078/pexels-photo-776078.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Juuu', age: "2", price: "30", location: "Kuta", user_id: User.all.sample.id, breed: "French Bulldog")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Bianco', age: "4", price: "35", location: "Seminjak", user_id: User.all.sample.id, breed: "Unknown")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/1753079/pexels-photo-1753079.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Foo', age: "1", price: "30", location: "Canggu", user_id: User.all.sample.id, breed: "Unknown")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/976871/pexels-photo-976871.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Foxy', age: "4", price: "25", location: "Seminjak", user_id: User.all.sample.id, breed: "Unknown")
dog.remote_image_url = url
dog.save

url = "https://images.pexels.com/photos/374906/pexels-photo-374906.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=400"
dog = Dog.new(name: 'Joe', age: "5", price: "20", location: "Seminjak", user_id: User.all.sample.id, breed: "Unknown")
dog.remote_image_url = url
dog.save



puts 'dogs created'



