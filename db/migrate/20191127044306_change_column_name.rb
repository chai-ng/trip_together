class ChangeColumnName < ActiveRecord::Migration[6.0]
  def up
    rename_column :votes, :type, :vote_type
  end

  def down
    rename_column :votes, :vote_type, :type
  end
end
