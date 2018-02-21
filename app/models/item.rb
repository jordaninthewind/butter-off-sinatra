class Item < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_presence_of :name, :quantity

end