class Pet < ApplicationRecord
  belongs_to :pet_type
  belongs_to :user
end
