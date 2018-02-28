class UserItems < ActiveRecord::Base
	belongs_to :users
	belongs_to :items

end