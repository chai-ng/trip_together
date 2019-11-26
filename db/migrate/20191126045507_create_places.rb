class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.text :place_id
      t.references :trip, null: false, foreign_key: true
      t.string :name
      t.string :international_phone_number
      t.string :formatted_address
      t.decimal :latitude
      t.decimal :longitude
      t.string :website
      t.string :opening_hours, array: true
      t.string :type
      t.float :rating
      t.integer :price_level
      t.float :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
