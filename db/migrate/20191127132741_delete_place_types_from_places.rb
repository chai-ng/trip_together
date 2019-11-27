class DeletePlaceTypesFromPlaces < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :place_type, :string
  end
end
