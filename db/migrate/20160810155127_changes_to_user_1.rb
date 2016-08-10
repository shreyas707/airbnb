class ChangesToUser1 < ActiveRecord::Migration
  def change

  	add_column :users, :role, :string

  	remove_column :users, :user_type_id	  

  end
end
