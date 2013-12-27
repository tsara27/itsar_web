class ApplicationController < ActionController::Base
  protect_from_forgery

  	def check_login
  		unless session[:login_status] == "true"
		redirect_to root_url
	end 
  end
end
