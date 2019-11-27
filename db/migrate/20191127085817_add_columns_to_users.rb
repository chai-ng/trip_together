class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :access_token, :text
    add_column :users, :expire_by, :datetime
  end

  def down
    remove_column :users, :access_token
    remove_column :users, :expire_by
  end
end
