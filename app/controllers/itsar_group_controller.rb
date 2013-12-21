class ItsarGroupController < ApplicationController
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Daftar Organisasi ITSAR"
		@aksi_form = "save_itsargroup"
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@itsar_grp = TItsar.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@itsar_grp = TItsar.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_itsargroup
		@a = params[:name_group]
		@b = params[:name_school]
		unless @a && @b.blank?
			@simpen = TItsar.create({:gname => @a, :schname => @b})
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end

		if params[:page]
			redirect_to "/itsar_group?page="+params[:page]
		else
			redirect_to "/itsar_group"
		end
	end

	def edit_itsargroup
		# Dynamic Variables
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Daftar Organisasi ITSAR"
		@aksi_form = params[:id] + "/update_itsar_group"
		ugroupf = TItsar.find(params[:id])
		@aa = ugroupf.gname.to_s
		@bb = ugroupf.schname.to_s
		@itsar_grp = TItsar.paginate(:page => params[:page], :per_page => 5)
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
			@itsar_grp = TItsar.where("gname LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@itsar_grp = TItsar.where("gname LIKE ?", "%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
		render :index
	end

	def update_itsargroup
		idgroup = TItsar.find(params[:id])
		idgroup.gname = params[:name_group]
		idgroup.schname = params[:name_school]
		idgroup.save

		redirect_to "/itsar_group/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil diperbaharui.".html_safe
	end

	def delete_itsar_group
		idgroup = TItsar.find(params[:id])
		idgroup.destroy
		redirect_to "/itsar_group/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end
end
