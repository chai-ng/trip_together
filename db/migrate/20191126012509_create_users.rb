class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :first_name
      t.string :last_name
      t.text :image_url
      t.string :email

      t.timestamps
    end
  end
end
