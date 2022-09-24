require 'faker'
require "open-uri"

# 1. Users:
puts "Destroying users..."
User.destroy_all
puts "Creating users..."
test_user = User.create(email: "test@gmail.com", password: "123123")
puts "Users created!"

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

description = [
  "Modern Apartment w/ Heating + Gym. My modern 1-bedroom apartment has everything you need for your spain trip. The unit comes with heating, a washer, and a dryer. During your stay, you can also enjoy using a convenient gym. Our Airbnb is within walking distance to several popular restaurants. An ideal base to explore Spain.",
  "Modern Apartment w/ Wi-Fi + Kitchen. Stay in this modern apartment and live like a true local in Spain. We're within walking distance to shops. Our rental comes with 2 bedrooms, and a kitchen that you're free to use any time. Wi-Fi, Netflix, free coffee and tea -- we've got everything you need.",
  "Luxurious Guest suite w/ Self Check-in + Pool. Want to visit Spain without breaking the bank? We have exactly what you're looking for. Our luxurious guest suite comes with studio, pool, self check-in, laptop-friendly workspace, and a crib, and we're within walking distance to night clubs.",
  "Luxurious Guest suite w/ Wi-Fi + Hot Tub. Thinking about visiting Spain? I have a studio guest suite that will be perfect for your stay. This luxurious rental comes with amenities such as Wi-Fi, self check-in, and free parking. Our hot tub is yours to enjoy, as well. If you want to go to parks, we're within walking distance.",
  "Peaceful Guest suite w/ Wi-Fi + Hot Tub. Parks in Spain will make this a vacation to remember, and my peaceful studio guest suite comes complete with hot tub. The Wi-Fi, self check-in, and free parking will make you wish you could stay even longer. If you rent my Airbnb, I know you'll have a great stay in Spain.",
  "Comfortable Guest suite w/ Wi-Fi + Gym. Stay in this comfortable guest suite and live like a true local in Spain. We're within walking distance to parks. Our rental comes with studio, and a gym that you're free to use any time. Wi-Fi, self check-in, a coffee maker -- we've got everything you need.",
  "Glamorous Apartment w/ Self Check-in + Indoor Fireplace. Want to visit Spain without breaking the bank? We have exactly what you're looking for. Our glamorous apartment comes with 3 bedrooms, indoor fireplace, self check-in, and a coffee maker, and we're within walking distance to parks.",
  "Rustic Apartment w/ Heating + Living Room. Thinking about visiting Spain? I have a 1-bedroom apartment that will be perfect for your stay. This rustic rental comes with amenities such as heating and a coffee maker. Our living room is yours to enjoy, as well. If you want to go to train routes, we're within walking distance..",
  "Rare Apartment w/ Self Check-in + Pool. Restaurants in Spain will make this a vacation to remember, and my rare 1-bedroom apartment comes complete with pool. The self check-in and laptop-friendly workspace will make you wish you could stay even longer. If you rent my Airbnb, I know you'll have a great stay in Spain.",
  "Charming Apartment w/ a Washer + Indoor Fireplace. My charming 1-bedroom apartment has everything you need for your Spain trip. The unit comes with a washer, a dryer, and Wi-Fi. During your stay, you can also enjoy using a convenient indoor fireplace. Our Airbnb is within walking distance to several popular bars. An ideal base to explore Spain."
]

address = [
  "Visitación de la Encina 14, No:2, Salamanca 37750",
  "Estrela 15, No:34, Cantabria 39340",
  "Cercas Bajas 52, No:8, Barcelona 08200",
  "Castelao 46, No:21, Zamora 49159",
  "Avda. Andalucía 12, No:14, La Rioja 26200",
  "Extramuros 56, No:23, Madrid 28391",
  "Extramuros 5, No:9, Madrid 28514",
  "Camiño Ancho 99, No:29, Salamanca 37789",
  "Avda. Alameda Sundheim 55, No:4, Huesca 22534",
  "C/ Pablo Iglesias 56, No:91, La Rioja 26325"
]

pet_type = [
  "Cat",
  "Dog"
]

10.times do  |i|

  flat = Flat.new(
    address: address[i],
    price: rand(70..300),
    title: flat_names[i],
    description: description[i],
    pet_type: pet_type[i],
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
