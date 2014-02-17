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
		if session[:login_status] == "true"
			@query_menu = TMenu.where("visible_to LIKE '%,"+session[:cur_tipe].to_s+",%'")
		else
			get_public = TUsertype.where(:utypename => "Public")
			get_public.each do |row|
				@idpublic = row.id
			end
			@query_menu = TMenu.where("visible_to LIKE '%,"+@idpublic.to_s+",%'")
		end
	end


end