class Item < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :quantity, :title

end