class CreateLocations < ActiveRecord::Migration[5.1]
  def change
  	create_table :locations do |l|
  		l.string :name
  	end
  end
end
