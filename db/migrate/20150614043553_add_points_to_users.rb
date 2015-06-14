class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, default: 5
  end
end
