class ChangesToUserAndRoom < ActiveRecord::Migration
  def change
  	add_column :users, :mobile_number, :string

  	add_column :rooms, :address, :string
  	add_column :rooms, :latitude, :float
  	add_column :rooms, :longitude, :float
  end
end
