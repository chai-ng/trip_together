class ChangeColNameOnPlaces < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :type, :place_type
    change_column :places, :place_type, :string
  end
end
