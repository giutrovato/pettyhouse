class AddPetTypeToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :pet_type, :string
  end
end
