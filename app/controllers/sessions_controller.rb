class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		remember_token=SecureRandom.urlsafe_base64
		cookies[:remember_token] = remember_token
		user.update! remember_token: Digest::SHA1.hexdigest(remember_token.to_s)
		redirect_to user
	else 
		flash.now[:error]= 'Invalid email/password combination'
		render :new
	end
  end

  def destroy
  end
end
