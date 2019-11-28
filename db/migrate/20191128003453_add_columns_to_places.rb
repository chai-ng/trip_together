class AddColumnsToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :upvote, :integer, default: 0
    add_column :places, :downvote, :integer, default: 0
  end
end
