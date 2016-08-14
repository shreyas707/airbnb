class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|

    	t.date :start_date
    	t.date :end_date
    	t.integer :user_id
    	t.integer :room_id

      t.timestamps null: false
    end
  end
end
