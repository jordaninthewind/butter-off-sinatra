class CommentsController < ApplicationController

	get '/items/:id/comments' do
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

	get '/comments/:id/edit' do
	  @comment = Comment.find(params[:id])
	  @user = current_user

	  if @comment.user == current_user

	    erb :'/comments/edit'
	  else
	  	session[:message] = "You don't own this comment."

	    redirect to "/items/#{@comment.item.id}"
	  end
	end

	post '/comments/:id/edit' do
		@comment = Comment.find(params[:id])
		@comment.update(:content => params[:content])

		redirect to "/items/#{@comment.item.id}"
	end

	get '/comments/:id/delete' do
	  @comment = Comment.find(params[:id])
	  if @comment.user == current_user

	  	erb :'/comments/delete'
	  else

	  	redirect to "/items/#{@comment.item.id}"
	  end
	end

	post '/comments/:id/delete' do
	  @comment = Comment.find(params[:id])
	  @item = @comment.item
	  @comment.destroy

	  redirect to "/items/#{@item.id}"
	end
end
