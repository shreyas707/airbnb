class ChangesToUser4 < ActiveRecord::Migration
  def change
  	remove_column :users, :role

  	add_column :users, :role, :string, default: "host"
  end
end
