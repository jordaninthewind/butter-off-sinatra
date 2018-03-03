class AddTimestampToItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :items, :created_at, :datetime
  end
end
