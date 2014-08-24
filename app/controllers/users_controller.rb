class UsersController < ApplicationController
	
	def new 
		@user=User.new	
	end
	before_action :signed_out_only, only:[:new,:create]
	before_action :signed_in_only, only: :show
	def create
		@user=User.new user_params
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end
	def user_params
		params.require(:user).permit :email, :username, :password, :password_confirmation	
	end
	def show
		user = User.find params[:id]
		@post = Post.new
		@posts = user.posts
		@label = user	
	end
end
