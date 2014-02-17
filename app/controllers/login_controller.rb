class LoginController < ApplicationController
	def index
		@aksi_form = "signin"
	end

	def signin
		username = params[:username].to_s
		passwd	= Base64.encode64(params[:password].to_s)
		query = TUser.where(:usrnme => username, :passwd => passwd)
		count_query = query.count
		if count_query == 1
			query.each do |row|
				@iduser = row.id
				@nama = row.nme.to_s
				@tipe_user = row.t_usertype_id	
			end
			session[:cur_id] = @iduser
			session[:cur_nama] = @nama
			session[:cur_tipe] = @tipe_user
			session[:login_status] = "true"
			redirect_to "/admin_home/"
		else
			redirect_to "/login"
		end
	end

	def signout
		reset_session
		redirect_to "/login"
	end
end
