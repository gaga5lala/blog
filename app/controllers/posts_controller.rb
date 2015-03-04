class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.page(params[:page]).per(3)
		@page_title = 'Home'
	end

	def new
		@post = Post.new
		@page_title = 'New Post'
	end

	def show
		find_post
		@author = @post.user.username
		@author_id = @post.user.id
		@page_title = @post.title
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to post_url(@post)
		else
			render :action => :new			
		end
	end

	def edit
		find_post
		@page_title = "edit #{@post.title}"
	end

	def update
	 	find_post
	 	if @post.update(post_params)
	 		redirect_to post_url(@post)
	 	else
	 		render :action => :edit
	 	end
	end

	def destroy
		find_post
		@post.destroy

		redirect_to posts_path
	end

	protected

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

  	def find_post
    	@post = Post.find(params[:id])
  	end
end
