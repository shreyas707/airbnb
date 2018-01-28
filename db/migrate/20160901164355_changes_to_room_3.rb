class ChangesToRoom3 < ActiveRecord::Migration
  def change
  	remove_column :rooms, :image_updated_at
  	remove_column :rooms, :img_url
  end
end
