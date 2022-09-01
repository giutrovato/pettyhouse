class PetType < ApplicationRecord
  has_many :pets
  has_many :allowed_flat_pets
end
