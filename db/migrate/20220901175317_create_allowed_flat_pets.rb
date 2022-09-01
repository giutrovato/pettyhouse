class CreateAllowedFlatPets < ActiveRecord::Migration[6.1]
  def change
    create_table :allowed_flat_pets do |t|
      t.references :pet_type, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
