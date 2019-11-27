require_relative '20191127085817_add_columns_to_users.rb'


class RevertUserColumnMigration < ActiveRecord::Migration[6.0]
  def change
    revert AddColumnsToUsers
  end
end
