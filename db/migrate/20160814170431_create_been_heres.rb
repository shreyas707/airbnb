class CreateBeenHeres < ActiveRecord::Migration
  def change
    create_table :been_heres do |t|

    	t.integer :room_id
    	t.integer :user_id
    	t.date :date

      t.timestamps null: false
    end
  end
end
