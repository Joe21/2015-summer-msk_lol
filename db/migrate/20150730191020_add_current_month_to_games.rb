class AddCurrentMonthToGames < ActiveRecord::Migration
  def change
  	add_column :games, :current_month, :string
  end
end
