class ApplicationController < ActionController::Base
  	protect_from_forgery
	# after_filter :define_sub_menus,:only => :define_menus
	helper_method :define_menus

	def check_login
		unless session[:login_status] == "true"
			redirect_to root_url
		end
	end

	def define_menus
		@query_menu = TMenu.where("visible_to LIKE '%,"+session[:cur_tipe].to_s+",%'")
	end

	# def define_sub_menus
		
	# end

end