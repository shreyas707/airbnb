class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

    	t.string :body
    	t.integer :rating
    	t.integer :user_id
    	t.integer :room_id

      t.timestamps null: false
    end
  end
end
