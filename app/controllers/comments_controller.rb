class CommentsController < ApplicationController

	get '/items/:id/comments' do
	  binding.pry
	  @item = Item.find(params[:id])
	  @comments = @item.comments

	  erb :'/comments/show'
	end

	post '/comments/:id/new' do
		@item = Item.find(params[:id])
		@comment = Comment.create(:content => params[:comment])
		@comment.item = @item
		@comment.user = current_user
		@item.comments << @comment

		redirect to "/items/#{@item.id}"
	end
end