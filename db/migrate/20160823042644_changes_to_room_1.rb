class ChangesToRoom1 < ActiveRecord::Migration
  def change
  	add_column :rooms, :view_count, :integer
  end
end
