class AddClosingTimeToMatchups < ActiveRecord::Migration[5.1]
  def change
    add_column :matchups, :closing_time, :datetime
  end
end
