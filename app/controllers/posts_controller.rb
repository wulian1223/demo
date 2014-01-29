class PostsController < ApplicationController
	before_action :signed_in_user,only:[:create,:destroy]
	before_action :correct_user,only: :destroy
	def new
		@posts = Post.new
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to posts_url
	end

	def create
		# @post = Post.new(params.require(:post).permit(:title,:content))
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "post successfully!"
			redirect_to posts_url
		else
			flash[:error] = "failed!!"
 			@feed_items=[]
			render "index"
		end
		 
	end

	def index
 		@posts = current_user.posts
 	end

	# def destroy
 #   	  @post.destroy
	#   respond_to do |format|
 #      format.html { redirect_to p_url }
 #      format.json { head :no_content }
 #      end
	# end

	private
      # Use callbacks to share common setup or constraints between actions.
     def correct_user
     	@post = current_user.posts.find_by(id: params[:id])
     	redirect_to root_url if @post.nil?
     end

     def set_post
       @post = Post.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def post_params
       params.require(:post).permit(:name, :title, :content)
     end
end