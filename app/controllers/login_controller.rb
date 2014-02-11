class LoginController < ApplicationController
	def index
		@aksi_form = "signin"
	end

	def signin
		username = params[:username].to_s
		passwd	= Base64.encode64(params[:password].to_s)
		query = TUser.find_by_sql("SELECT * FROM t_users WHERE usrnme = '"+username+"' AND passwd = '"+passwd+"'")
		count_query = query.count
		if count_query == 1
			query.each do |row|
				@iduser = row.id
				@nama = row.nme.to_s
				@tipe_user = row.usrtype	
			end
			session[:cur_id] = @iduser
			session[:cur_nama] = @nama
			session[:cur_tipe] = @tipe_user
			session[:login_status] = "true"
			redirect_to "/home"
		else
			redirect_to root_url
		end
	end

	def signout
		reset_session
		redirect_to root_url
	end
end
