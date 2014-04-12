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

	def edit
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Tipe Artikel"
		@aksi_form = "#{params[:id]}/renew"
		key = TType.find(params[:id])
		@aa = key.type_code
		@bb = key.article_type
		@types = TType.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def renew
		the_type = TType.find(params[:id])
		the_type.type_code = params[:the_code]
		the_type.article_type = params[:the_type]
		unless the_type.save
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		else
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end
		redirect_to article_type_index_path
	end

	def delete
		the_type = TType.find(params[:id])
		the_type.destroy
		redirect_to article_type_index_path, :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end

	def search
		@a = params[:search_form]
		@nama_btn = "Simpan"
		@nama_form = " - Buat Tipe Artikel"
		@aksi_form = "create"
		@types = TType.where("article_type LIKE ?","%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
		render :index
	end
end
