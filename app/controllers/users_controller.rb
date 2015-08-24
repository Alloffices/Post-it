class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post = @user.posts
	end

	def upvote
		@post = Post.find(params[:id])
		@user = User.find(params[:id])
		@post.upvote_by current_user
		redirect_to :back
	end
end
