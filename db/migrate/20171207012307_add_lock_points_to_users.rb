class AddLockPointsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lock_points, :integer, default: 5
  end
end
