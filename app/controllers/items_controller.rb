class ItemsController < ApplicationController

  get '/items' do

	if logged_in?
		@user = User.find(session[:user_id])

		erb :'/items/index'
	else

		redirect to '/'
	end
  end

end