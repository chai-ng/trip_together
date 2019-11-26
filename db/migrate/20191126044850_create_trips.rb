class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :calendar_name
      t.string :calendar_time_zone
      t.references :user, null: false, foreign_key: true
      t.text :calendar_id

      t.timestamps
    end
  end
end
