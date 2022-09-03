class AddTitleToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :title, :string
  end
end
