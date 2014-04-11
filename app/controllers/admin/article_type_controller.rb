class Admin::ArticleTypeController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Tipe Artikel"
		@aksi_form = "create"
		@types = TType.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
	end

	def create
		@a = params[:the_code]
		@b = params[:the_type]
		@c = session[:cur_id]
		simpen = TType.create({:type_code => @a, :article_type => @b, :t_user_id => @c })
		if simpen.valid?
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		else
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		end
		if params[:page]
			redirect_to "/article_type?page="+params[:page]
		else
			redirect_to article_type_index_path
		end
	end

	def edit_itsargroup
		# Dynamic Variables
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Daftar Organisasi ITSAR"
		@aksi_form = params[:id] + "/update_itsar_group"
		ugroupf = TType.find(params[:id])
		@aa = ugroupf.gname.to_s
		@bb = ugroupf.schname.to_s
		@cc = ugroupf.shortname
		@itsar_grp = TType.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def search
		@a = params[:search_form]
		@nama_btn = "Simpan"
		@nama_form = " - Buat Daftar Organisasi ITSAR"
		@aksi_form = "save_itsargroup"
		@itsar_grp = TType.where("gname LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
		render :index
	end

	def update_itsargroup
		idgroup = TType.find(params[:id])
		idgroup.gname = params[:name_group]
		idgroup.schname = params[:name_school]
		idgroup.shortname = params[:code_input]
		unless idgroup.save
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		else
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end
		redirect_to "/itsar_group/"
	end

	def delete_itsar_group
		idgroup = TType.find(params[:id])
		idgroup.destroy
		redirect_to "/itsar_group/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end
end
