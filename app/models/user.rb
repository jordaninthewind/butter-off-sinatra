class User < ActiveRecord::Base
	has_many :items
	has_many :comments
	belongs_to :location
	validates_presence_of :username, :email
	validates_uniqueness_of :username
	has_secure_password
	
	def slug
	  self.username.gsub(" ", "-")
	end

	def self.find_by_slug(username)
	  self.find_by(:username => username.gsub("-", " "))
	end

end