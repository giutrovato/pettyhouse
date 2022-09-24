class AddPetTypeToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :pet_type, :text
  end
end
