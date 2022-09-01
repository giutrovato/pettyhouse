class AllowedFlatPet < ApplicationRecord
  belongs_to :pet_type
  belongs_to :flat
end
