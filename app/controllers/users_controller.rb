class UsersController<ApplicationController
	before_action :signed_in_user, only:[:edit,:update,:show,:index,:destroy]
	before_action :correct_user, only:[:edit,:update,:show]
	before_action :admin_user, only: [:destroy]
	def index
		# puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!userid========#{@user.id}!!!!!!!!!!!!!!!!!!!!!"
		# strid = @user.id
		@user = User.new
		if @current_user.admin == false
			flash[:failure]="cant see this page sorry!"
			redirect_to user_path(@current_user.id)
		end
	end


	def create
		@user = User.new(params.require(:user).permit(:name,:email,:password))
		if @user.save
			flash[:success] = "welcome"

			redirect_to @user#first_path
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
 	end

	def update
 		if @user.update_attributes(user_params)
			flash[:success] = "update!!!"
			redirect_to @user
		else
			render "edit"
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url #:action => 'index'
 	end
	private
      # Use callbacks to share common setup or constraints between actions.
     def set_user
       @user = User.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def user_params
       params.require(:user).permit(:name, :email, :password)
     end

   
     
     def correct_user
     	@user = User.find(params[:id])
     	redirect_to(root_url) unless current_user?(@user)
     end

     def admin_user
     	redirect_to(root_url) unless current_user.admin?
     end

end