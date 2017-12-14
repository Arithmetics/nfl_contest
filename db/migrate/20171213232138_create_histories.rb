class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :year
      t.string :winner
      t.integer :correct_picks
      t.integer :winnings

      t.timestamps
    end
  end
end
