class WelcomesController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@user = User.find(params[:id])
	end

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
	end

end
