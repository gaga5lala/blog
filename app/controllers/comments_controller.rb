class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		if @post.comments.create(params[:comment].permit(:name, :body))
			redirect_to post_path(@post)
		else
			render :action => :create
		end
		
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
end
