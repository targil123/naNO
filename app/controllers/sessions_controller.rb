class SessionsController < ApplicationController
  def new
  end
  before_action :signed_out_only, only:[:new,:create]
  before_action :signed_in_only, only: :destroy
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		remember_token=User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update! remember_token: User.digest(remember_token)
		redirect_to user
	else 
		flash.now[:error]= 'Invalid email/password combination'
		render :new
	end
  end

  def destroy
	current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
    	cookies.delete(:remember_token)
    	self.current_user = nil
	redirect_to root_path
  end
end
