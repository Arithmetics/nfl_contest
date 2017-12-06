class AddChampionshipsToUsers < ActiveRecord::Migration[5.1]

  def change
    add_column :users, :championships, :integer, default: false
  end
  
end
