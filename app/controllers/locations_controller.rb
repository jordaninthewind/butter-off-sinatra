class LocationsController < ApplicationController

	get '/locations' do

		erb :'/locations/index'
	end

	get '/locations/new' do

		erb :'/locations/new'
	end

	post '/locations/new' do
		@location = Location.create(params[:location])
		binding.pry
		redirect to "/locations"
	end

end