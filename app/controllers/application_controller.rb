class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  attr_writer :current_user
  def current_user
	@current_user ||= begin
		remember_token = User.digest(cookies[:remember_token])
		User.find_by(remember_token: remember_token)	
	end
  end	
  def signed_in_only
	redirect_to root_path unless current_user
  end
  def signed_out_only
	redirect_to current_user if current_user
  end
end
