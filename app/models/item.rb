class Item < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_presence_of :name, :quantity

	def created_time
		self.created_at.strftime("Offered on %m/%d/%Y at %H:%M")
	end

end