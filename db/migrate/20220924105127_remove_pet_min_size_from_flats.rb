class RemovePetMinSizeFromFlats < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :pet_min_size
  end
end
