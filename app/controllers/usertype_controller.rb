class UsertypeController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Tipe Pengguna Baru"
		@aksi_form = "save_usertype"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@usr = TUsertype.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr = TUsertype.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_usertype
		@a = params[:name_usertype].titleize
		@b = session[:cur_id]
		unless @a.blank?
			unless @b.blank?
			 	@simpen = TUsertype.create({:utypename => @a,:t_user_id => @b})
			else
				@simpen = TUsertype.create({:utypename => @a,:t_user_id => "0"})
			end
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end

		if params[:page]
			redirect_to "/usertype?page="+params[:page]
		else
			redirect_to "/usertype"
		end
	end

	def search
		@a = params[:search_form]
		@nama_btn = "Simpan"
		@nama_form = " - Buat Tipe Pengguna Baru"
		@aksi_form = "save_usertype"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@usr = TUsertype.where("utypename LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@usr = TUsertype.where("utypename LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
		render :index
	end

	def edit_usertype
		# Dynamic Variables
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Tipe Pengguna"
		@aksi_form = params[:id] + "/update_usertype"
		utypef = TUsertype.find(params[:id])
		@aa = utypef.utypename.to_s
		@usr = TUsertype.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def update_usertype
		idperson = TUsertype.find(params[:id])
		idperson.utypename = params[:name_usertype].titleize
		idperson.save

		redirect_to "/usertype/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil diperbaharui.".html_safe
	end

	def delete_usertype
		idperson = TUsertype.find(params[:id])
		idperson.destroy
		redirect_to "/usertype/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end

	def callback_typename
		@nama_tipe = TUsertype.where("utypename = ?", params[:name_usertype].titleize).count
		render text: @nama_tipe
	end
end
