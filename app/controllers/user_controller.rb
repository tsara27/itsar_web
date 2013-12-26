class UserController < ApplicationController
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Pengguna Baru"
		@aksi_form = "save_user"
		@records = TItsar.order('created_at ASC')
		@records_role = TUsertype.order('created_at ASC')
		@meter = "0"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@usr_table = TUser.joins('JOIN t_itsar ON t_itsar.id = t_user.itsar_id').order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr_table = TUser.joins('JOIN t_itsars ON t_itsars.id = t_users.itsar_id','JOIN t_usertypes ON t_usertypes.id = t_users.usrtype').select("t_users.*,t_itsars.gname, t_usertypes.utypename").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_user
		@a = params[:fullname]
		@b = params[:name_user]
		@c = params[:password_user]
		@d = params[:email_address]
		@e = params[:organisasi]
		@f = params[:role_type]
		@g = params[:gender]

		unless @a && @b && @c && @d && @e && @f.blank?
			@simpen = TUser.create({:nme => @a, :usrnme => @b, :passwd => @c, :mail => @d, :gndr => @g, :usrtype => @f, :itsar_id => @e})
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
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
		@ee = userdata.usrtype
		@ff = userdata.itsar_id
		@gg = userdata.passwd
		@usr_table = TUser.joins('JOIN t_itsars ON t_itsars.id = t_users.itsar_id','JOIN t_usertypes ON t_usertypes.id = t_users.usrtype').select("t_users.*,t_itsars.gname, t_usertypes.utypename").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		respond_to do |format|
	      format.html { render "index"}
	    end
	end

	def search
		@a = params[:search_form]
		@nama_btn = "Simpan"
		@nama_form = " - Buat Daftar Organisasi ITSAR"
		@aksi_form = "save_itsargroup"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			@usr_table = TUser.where("gname LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr_table = TUser.where("gname LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
		render :index
	end

	def update_itsargroup
		idgroup = TUser.find(params[:id])
		idgroup.gname = params[:name_group]
		idgroup.schname = params[:name_school]
		idgroup.save

		redirect_to "/itsar_group/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil diperbaharui.".html_safe
	end

	def delete_itsar_group
		idgroup = TUser.find(params[:id])
		idgroup.destroy
		redirect_to "/itsar_group/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end

	def callback_username
		@nama_user = TUser.where("usrnme = ?", params[:name_user]).count
		render text: @nama_user
	end
end
