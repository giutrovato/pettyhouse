class RemovePetTypeFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pets, :pet_type, index: true, foreign_key: true
  end
end
