class User < ActiveRecord::Base
	has_many :items
	has_many :comments, through: :items
	validates_presence_of :username, :password, :email
	has_secure_password
end