class ChangesToRoom2 < ActiveRecord::Migration
  def change
  	remove_column :rooms, :image_file_name
  	remove_column :rooms, :image_content_type
  	remove_column :rooms, :image_file_size
  	remove_column :rooms, :image_file_name
  end
end
