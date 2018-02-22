class CommentsController < ApplicationController

	get '/items/:id/comments' do
	  @item = Item.find(params[:id])
	  @comments = @item.comments

	  erb :'/comments/show'
	end

end