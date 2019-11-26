class CreateTravellers < ActiveRecord::Migration[6.0]
  def change
    create_table :travellers do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :user_email
      t.boolean :existing_user
      t.boolean :accepted_invite
      t.float :user_budget

      t.timestamps
    end
  end
end
