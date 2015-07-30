class AddingAtrributesToChamps < ActiveRecord::Migration
  def change
  	add_column :champs, :riot_id, :integer, unique: true
  	add_column :champs, :name, :string
  	add_column :champs, :img_url, :string
  	add_column :champs, :appearance_count, :integer, default: 0
  	add_column :champs, :marry_count, :integer, default: 0
  	add_column :champs, :sleep_count, :integer, default: 0
  	add_column :champs, :kill_count, :integer, default: 0
  end
end