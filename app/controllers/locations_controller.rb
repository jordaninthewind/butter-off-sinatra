class LocationsController < ApplicationController

	get '/locations' do

		erb :'/locations/index'
	end

	get '/locations/new' do

		erb :'/locations/new'
	end

	post '/locations/new' do
		@location = Location.create(params[:location])

		redirect to "/locations"
	end

	get '/locations/:slug' do
		@location = Location.find_by_slug(params[:slug])

		erb :"/locations/show"
	end

end