class ChangeUidForUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :uid, :string
  end

  def down
    change_column :users, :uid, :integer
  end
end
