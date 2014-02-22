class UserController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Pengguna Baru"
		@aksi_form = "save_user"
		@records = TItsar.order('created_at ASC')
		@records_role = TUsertype.order('created_at ASC')
		@dd = "1"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@usr_table = TUser.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr_table = TUser.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_user
		@a = params[:fullname].titleize
		@b = params[:name_user].downcase
		@c = params[:password_f][:passwd_confirmation]
		@d = params[:email_address]
		@e = params[:organisasi]
		@f = params[:role_type]
		@g = params[:gender]
		@h = session[:cur_id]
		@simpen = TUser.create({:nme => @a, :usrnme => @b, :passwd => @c, :mail => @d, :gndr => @g, :t_usertype_id => @f, :t_itsar_id => @e, :t_user_id => @h})

		if @simpen.valid?
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		else
			# flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
			flash[:notice_failed] = @simpen.errors.full_messages
		end
		
		if params[:page]
			redirect_to "/user?page="+params[:page]
		else
			redirect_to "/user"
		end
	end

	def edit_user
		# Dynamic Variables
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Data Pengguna"
		@aksi_form = params[:id] + "/update_user"
		@records = TItsar.order('created_at ASC')
		@records_role = TUsertype.order('created_at ASC')
		userdata = TUser.find(params[:id])
		@aa = userdata.nme.to_s
		@bb = userdata.usrnme.to_s
		@cc = userdata.mail.to_s
		@dd = userdata.gndr.to_s
		@ee = userdata.t_usertype_id
		@ff = userdata.t_itsar_id
		@gg = Base64.decode64(userdata.passwd)
		@usr_table = TUser.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def search
		@a = params[:search_form]
		@nama_btn = "Simpan"
		@nama_form = " - Buat Pengguna Baru"
		@aksi_form = "save_user"
		@records = TItsar.order('created_at ASC')
		@records_role = TUsertype.order('created_at ASC')
		@dd = "1"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			@usr_table = TUser.where("nme LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr_table = TUser.where("nme LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
		render :index
	end

	def update_user
		iduser = TUser.find(params[:id])
		iduser.nme = params[:fullname].titleize
		iduser.usrnme = params[:name_user].downcase
		iduser.mail = params[:email_address]
		iduser.gndr = params[:gender]
		iduser.t_usertype_id = params[:role_type]
		iduser.t_itsar_id = params[:organisasi]
		iduser.passwd = params[:password_f][:passwd_confirmation]
		unless iduser.save
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		else
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end
		redirect_to "/user/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil diperbaharui.".html_safe
	end

	def delete_user
		idgroup = TUser.find(params[:id])
		idgroup.destroy
		redirect_to "/user/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end

	def callback_username
		@nama_user = TUser.where("usrnme = ?", params[:name_user].downcase).count
		render text: @nama_user
	end
end
