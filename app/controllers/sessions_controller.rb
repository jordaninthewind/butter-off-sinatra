class SessionsController < ApplicationController

	get '/login' do
	
	  erb :'/users/login'
	end

	post '/login' do
	  @user = User.find_by(:username => params[:user][:username])
	  if @user.authenticate(params[:user][:password])
	  	session[:user_id] = @user.id
	  	session[:login_message] = nil

	  	redirect to '/'
	  else
	  	
	  	session[:login_message] = "Incorrect Login Information, Please Try Again"

	  	erb :'/users/login'
	  end	  
	end

	get '/logout' do
	  session.clear

	  redirect to '/'
	end

end