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
  "My apartment was robbed and everything was replaced with exact replicas. I told my roommate and he said 'Do I know you?",
  "My apartment is infested with koala bears. It's the cutest infestation ever. Way better than cockroaches. When I turn on the light, a bunch of koala bears scatter, but I don't want them too. I'm like, hey, hold on fellows, lemme hold one of you and feed you a leaf.",
  "My apartment complex isn't. In fact, it's rather simple.",
  "Spain is like a loft apartment over a really great party.",
  "I don't know how to put this but I'm kind of a big deal. People know me. I'm very important. I have many leather-bound books and my apartment smells of rich mahogany.",
  "I don't want to achieve immortality through my work. I want to achieve immortality through not dying. I don't want to live on in the hearts of my countrymen. I want to live on in my apartment.",
  "For every year past the age of 27, you need to take another step toward commitment somewhere in your life. Instead of freelancing, you get a staff job. Instead of renting, you buy. Fine, instead of couch-surfing, you rent.",
  "12% of people marry because they are completely in love. 88% of people marry just so they are then liable for only half of their rent.",
  "I think of birth as the search for a larger apartment.",
  "I sold my house this week. I got a pretty good price for it. But it made my landlord mad as hell."
]

10.times do  |i|

  flat = Flat.new(
    address: Faker::Address.full_address,
    price: rand(70..300),
    title: flat_names[i],
    description: description[i],
    pet_min_size: rand(2..8),
    pet_max_size: rand(22..55)
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
