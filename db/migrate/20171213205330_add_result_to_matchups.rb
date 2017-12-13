class AddResultToMatchups < ActiveRecord::Migration[5.1]
  def change
    add_column :matchups, :result, :string, default: "pending"
  end
end
