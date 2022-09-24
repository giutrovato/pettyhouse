class RemovePetMaxSizeFromFlats < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :pet_max_size
  end
end
