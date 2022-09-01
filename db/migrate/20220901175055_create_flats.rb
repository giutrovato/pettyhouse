class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :address
      t.decimal :price
      t.text :description
      t.integer :pet_min_size
      t.integer :pet_max_size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
