class User < ActiveRecord::Base
	has_many :items
	has_secure_password
	validate_presence_of :username, :password, :email
	
end