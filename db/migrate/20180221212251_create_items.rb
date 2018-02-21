class CreateItems < ActiveRecord::Migration[5.1]
  def change
  	create_table :items do |i|
  		i.string :name
  		i.integer :quantity
  		i.integer :user_id
  	end
  end
end
