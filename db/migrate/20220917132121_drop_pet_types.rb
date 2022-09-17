class DropPetTypes < ActiveRecord::Migration[6.1]
  def change
    drop_table :allowed_flat_pets
    drop_table :pet_types
  end
end
