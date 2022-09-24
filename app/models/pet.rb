class Pet < ApplicationRecord
  belongs_to :user

  enum pet_max_size: {
    small: 0,
    medium: 1,
    large: 2
  }
end
