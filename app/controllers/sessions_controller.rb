class SessionsController < ApplicationController

	get '/login' do
	
	  erb :'/users/login'
	end

	post '/login' do
	  @user = User.find_by(:username => params[:user][:username])
	  if @user.authenticate(params[:user][:password])
	  	session[:user_id] = @user.id

	    redirect to '/items'
	  else

	    redirect to '/'
  	  end
	end

	get '/logout' do
	  session = {}

	  redirect to '/'
	end

end