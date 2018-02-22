class ItemsController < ApplicationController

  get '/items' do
	if logged_in?
		@user = current_user

		erb :'/items/index'
	else

		redirect to '/'
	end
  end

  get '/items/new' do
  	if logged_in?

  	  erb :'/items/new'
  	else

  	  redirect to '/'
  	end
  end

  post '/items/new' do
  	@item = Item.create(params[:item])
  	@item.user = current_user
  	@item.save

  	redirect to '/items'
  end

end