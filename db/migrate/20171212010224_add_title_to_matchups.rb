class AddTitleToMatchups < ActiveRecord::Migration[5.1]
  def change
    add_column :matchups, :title, :string
  end
end
