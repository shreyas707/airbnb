class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|

    	t.string :name
    	t.text :description

      t.timestamps null: false
    end
  end
end
