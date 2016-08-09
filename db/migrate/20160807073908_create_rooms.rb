class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

    	t.string :name
    	t.text :description
    	t.integer :price
    	t.text :rules
    	t.integer :minimum_days
    	t.integer :city_id
    	t.integer :room_type_id
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
