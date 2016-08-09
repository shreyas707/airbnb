class CreateAmenityRooms < ActiveRecord::Migration
  def change
    create_table :amenity_rooms do |t|

    	t.integer :amenity_id
    	t.integer :room_id

      t.timestamps null: false
    end
  end
end
