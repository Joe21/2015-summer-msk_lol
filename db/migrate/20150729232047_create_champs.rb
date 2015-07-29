class CreateChamps < ActiveRecord::Migration
  def change
    create_table :champs do |t|

      t.timestamps null: false
    end
  end
end
