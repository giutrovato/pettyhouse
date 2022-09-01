class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.references :pet_type, null: false, foreign_key: true
      t.string :breed
      t.decimal :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
