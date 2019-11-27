class AddNewColToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :establishment_type, :string, array: true
  end
end
