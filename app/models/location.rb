class Location < ActiveRecord::Base
	validates_uniqueness_of :name
	validates_presence_of :name

	has_many :users
	has_many :user_items
	has_many :items, through: :users

	# delegations

	def slug
	  self.username.gsub(" ", "-")
	end

	def self.find_by_slug(name)
	  self.find_by(:name => name.gsub("-", " "))
	end

end