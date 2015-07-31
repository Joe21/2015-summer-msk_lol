class CreateMatchmakers < ActiveRecord::Migration
  def change
    create_table :matchmakers do |t|
    	t.belongs_to :champ, index: true
    	t.belongs_to :round, index: true
      t.timestamps null: false
    end
  end
end
