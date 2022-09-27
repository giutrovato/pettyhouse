class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  enum pet_max_size: {
    small: 0,
    medium: 1,
    large: 2
  }
end
