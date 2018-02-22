class ItemsController < ApplicationController

	get '/items' do
		@user = User.find(session[:user_id])

		erb :'/items/index'
	end

end