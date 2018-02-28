class CreateUserItems < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_items do |ui|
  		ui.integer :user_id
  		ui.integer :item_id
  	end
  end
end
