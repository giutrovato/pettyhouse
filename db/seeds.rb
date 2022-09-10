require 'faker'
require "open-uri"

# 1. Users:
puts "Destroying users..."
User.destroy_all
puts "Creating users..."
test_user = User.create(email: "test@gmail.com", password: "123123")
puts "Üsers created!"

# 2. Flats:
puts "Destroying flats..."
Flat.destroy_all
puts "Creating flats..."
images = [
  'https://www.book-a-flat.com/images/paris-salon-2.jpg',
  'https://www.book-a-flat.com/images/paris-salon-3.jpg',
  'https://www.servereworldsystem.com/include/temps/apts/3501/mag/1.jpg',
  'https://i.pinimg.com/736x/ea/24/c3/ea24c333dc1d379b83e5d58d25fe2837.jpg',
  'https://i.pinimg.com/originals/4c/c0/3b/4cc03b2d0737730a709264a9bea1243a.jpg',
  'https://www.apartmentguide.com/blog/wp-content/uploads/2019/10/flat_hero.jpg',
  'https://lh4.googleusercontent.com/jcTnIP3Pb60MQBpgyiUGvAUsL9vhZuZwm6O4oY9xQdqKOhWsgbhK7xYIFyqLbOP-Z_JcdHBm96INFW1HIkg1TOaHNAcneD7FdK1rvgy_SIO5EnqlPAmYGPMn4Hc29f75c2mqcn2J',
  'https://jkinmobiliaria.com/wp-content/uploads/2021/02/IMAGEN-1.jpg',
  'https://static.tokkobroker.com/pictures/94308976127162026864987576830006282087518527122462517768669636926520893649578.jpg',
  'https://image.architonic.com/pro2-3/20167621/modern-doors-moderne-innentueren-raumhohe-tueren-flat-verkehrswei-01-pro-b-arcit18.jpg'

] # create an array of 10 urls
flat_names = ["Barcelona",
  "Madrid",
  "Valencia",
  "Seville",
  "Granada",
  "Granada",
  "Bilbao",
  "Malaga",
  "Toledo",
  "Zaragoza"
]
10.times do  |i|

  flat = Flat.new(
    address: Faker::Address.full_address,
    price: rand(30..50),
    title: flat_names[i],
    description: Faker::Quote.yoda,
    pet_min_size: rand(2..8),
    pet_max_size: rand(9..17)
  )
  photo = URI.open(images[i])
  flat.photos.attach(io: photo, filename: "flat_#{i}.jpg", content_type: 'image/jpg')
  flat.user = test_user
  flat.save
end
puts "Flats created!"

# # 3. Photos
# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
