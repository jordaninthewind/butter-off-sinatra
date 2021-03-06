class UsersController < ApplicationController

	get '/signup' do
		
	  erb :'/users/new'
	end

	post '/signup' do
	  @user = User.create(params[:user])

	  if !!@user
	  	session[:user_id] = @user.id
	  end

	    redirect to '/'
	end

	get '/users/:slug' do
	  @user = User.find_by_slug(params[:slug])

	  erb :'/users/show'
	end

	get '/users/:slug/edit' do
	  @user = User.find_by_slug(params[:slug])
	  if @user.id == session[:user_id]

	  	erb :'/users/edit'
	  else

	  	redirect to '/'
	  end
	end

	post '/users/:slug/edit' do
	  @user = User.find_by_slug(params[:slug])
	  @user.update(params[:user])

	  redirect to "/users/#{@user.username}"
	end

	get '/users/:slug/delete' do
	  @user = User.find_by_slug(params[:slug])
	  if @user.id == session[:user_id]

		erb :'/users/delete'
	  else

		redirect to '/'
	  end
	end

	post '/users/:slug/delete' do
	  if params[:delete] == "DELETE" && logged_in?
		@user = User.find_by_slug(params[:slug])
		@user.items.destroy_all
		@user.comments.destroy_all
		@user.destroy
		session.clear
	  end

		redirect to '/'
	end
end