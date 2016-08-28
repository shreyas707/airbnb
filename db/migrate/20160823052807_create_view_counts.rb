class CreateViewCounts < ActiveRecord::Migration
  def change
    create_table :view_counts do |t|
    	t.integer :user_id
    	t.integer :room_id
    	t.integer :view_count
      t.timestamps null: false
    end
  end
end
