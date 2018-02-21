class User < ActiveRecord::Base
	has_many :items
	has_secure_password
	validates_presence_of :username, :password, :email
	
end