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
      @user = current_user

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

  get '/items/:id' do
  	@item = Item.find(params[:id])

  	erb :'/items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @user = current_user

    if @item.user_id == @user.id

      erb :'/items/edit'
    else
      redirect to '/items'
    end
  end

  post '/items/:id/edit' do
    @item = Item.find(params[:id])
    @item.update(params[:item])

    redirect to "/items/#{@item.id}"
  end
end