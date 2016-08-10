class ChangesToUser2 < ActiveRecord::Migration
  def change

  	remove_column :users, :role

  	add_column :users, :role, :string, default: "user"

  end
end
