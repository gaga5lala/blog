class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@page_title = 'Home'
		@post = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@page_title = @post.title
	end

	def new
		@p
	end

	def edit
		
	end

	def update
	 	
	end

	def create
		
	end

	def destroy #old not general name delete
		
	end

	#protected

  	#def find_event
    #	@event = Event.find(params[:id])
  	#end
end
