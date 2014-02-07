class ApplicationController < ActionController::Base
  	protect_from_forgery
	helper_method :define_menus 
	def check_login
		unless session[:login_status] == "true"
		redirect_to root_url
	end

	def define_menus
		@query_menu = TMenu.find_by_sql("SELECT menu_name, url FROM t_menus WHERE visible_to LIKE '%,"+session[:cur_tipe].to_s+",%'")
	end

	end
end
