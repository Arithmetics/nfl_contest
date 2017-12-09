class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.references :user, foreign_key: true
      t.references :matchup, foreign_key: true
      t.boolean :lock
      t.string :choice

      t.timestamps
    end
  end
end
