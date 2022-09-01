class Flat < ApplicationRecord
  belongs_to :user
  has_many :allowed_flat_pets
end
