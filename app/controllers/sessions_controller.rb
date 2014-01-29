
class SessionsController < ApplicationController
	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user != nil
			if @user.password == params[:session][:password]
				sign_in @user
				redirect_back_or @user
				# redirect_to :action =>"user#show", :id=>@user.id
 			else
 				binding.pry 
				flash[:error] = 'invalid'
				render "new"
	 		end
	 	else 
	 		render "new"
	 	end
	end

	def new
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
