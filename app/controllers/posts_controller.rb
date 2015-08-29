class PostsController < ApplicationController
	before_action :authenticate, except: [:index]


	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :description, :image))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_by current_user
		redirect_to :back
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

	def authenticate
		:authenticate_user! && current_user.try(:admin?)
	end

end
