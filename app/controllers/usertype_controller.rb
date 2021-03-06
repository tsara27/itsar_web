class UsertypeController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		view_form("Simpan"," - Buat Tipe Pengguna Baru","save_usertype")
		@usr = TUsertype.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
	end

	def save_usertype
		@a = params[:name_usertype].titleize
		@b = session[:cur_id]
		simpen = TUsertype.create({:utypename => @a,:t_user_id => @b})
		if simpen.valid?
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		else
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		end

		if params[:page]
			redirect_to "/usertype?page="+params[:page]
		else
			redirect_to "/usertype"
		end
	end

	def search
		@a = params[:search_form]
		view_form("Simpan"," - Buat Tipe Pengguna Baru","save_usertype")
		@usr = TUsertype.where("utypename LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
		render :index
	end

	def edit_usertype
		view_form("Perbaharui"," - Perbaharui Tipe Pengguna",params[:id] + "/update_usertype")		
		utypef = TUsertype.find(params[:id])
		@aa = utypef.utypename.to_s
		@usr = TUsertype.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def update_usertype
		idperson = TUsertype.find(params[:id])
		idperson.utypename = params[:name_usertype].titleize
		unless idperson.save
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		else
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end

		redirect_to "/usertype/"
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

	def view_form(nama_btn,nama_form,aksi_form)
		@nama_btn = nama_btn
		@nama_form = nama_form
		@aksi_form = aksi_form
	end

end
