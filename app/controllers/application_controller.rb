class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_that_user_signed_in
  	if session[:user_id].nil? then
    	redirect_to session_sign_in_path
  	end
  end
end
