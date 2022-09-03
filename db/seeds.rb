require 'faker'

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
10.times do
  flat = Flat.new(
    address: Faker::Address.full_address,
    price: rand(30..50),
    description: Faker::Quote.yoda,
    pet_min_size: rand(2..8),
    pet_max_size: rand(9..17)
  )
  flat.user = test_user
  flat.save
end
puts "Flats created!"
