class UsersController < ApplicationController

	get '/signup' do
		
	  erb :'/users/new'
	end

	post '/signup' do
	  @user = User.create(params[:user])
	  session[:user_id] = @user.id

	  redirect to '/items'
	end

	get '/users/:slug' do
	  @user = User.find_by_slug(params[:slug])

	  erb :'/users/show'
	end

end