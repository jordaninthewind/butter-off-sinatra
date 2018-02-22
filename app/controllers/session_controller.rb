class SessionController < ApplicationController

	get '/login' do
	
	  erb :'/users/login'
	end

	post '/login' do
	  # @user = User.find....

	  redirect to '/items'
	end

	get '/logout' do
	  session = {}

	  redirect to '/'
	end

end