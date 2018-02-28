class AddLocationToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :location, :string
  	add_column :users, :location_id, :integer
  end
end
