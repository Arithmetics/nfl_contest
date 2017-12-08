class CreateMatchups < ActiveRecord::Migration[5.1]
  def change
    create_table :matchups do |t|
      t.string :away_team
      t.float :away_line
      t.string :away_detail
      t.string :home_team
      t.float :home_line
      t.string :home_detail

      t.timestamps
    end
  end
end
