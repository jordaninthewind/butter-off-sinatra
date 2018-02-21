class CreateComments < ActiveRecord::Migration[5.1]
  def change
  	create_table :comments do |c|
  		c.string :content
  		c.integer :item_id
  	end
  end
end
