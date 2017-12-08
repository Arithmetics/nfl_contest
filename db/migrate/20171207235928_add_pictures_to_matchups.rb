class AddPicturesToMatchups < ActiveRecord::Migration[5.1]
  def change
    add_column :matchups, :home_picture, :string
    add_column :matchups, :away_picture, :string
  end
end
