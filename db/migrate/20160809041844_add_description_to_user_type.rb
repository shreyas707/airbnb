class AddDescriptionToUserType < ActiveRecord::Migration
  def change

  	add_column :user_types, :description, :text	  

  end
end
