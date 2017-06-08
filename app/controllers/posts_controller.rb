class PostsController < ApplicationController

def index
	@posts = Post.all
end

def show
	@post = Post.find(params[:id])
end

def new
	@post = Post.new
end

def create
	@post = Post.create(post_params)
	@post.save
	if @post.save
		redirect_to posts_path
	else
		render 'new'
	end
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.find(params[:id])
	@post.update
	if @post.update
		redirect_to @post
	else
		render 'edit'
	end
end

private
	def post_params
		params.require(:post).permit(:image, :caption)
	end
end
