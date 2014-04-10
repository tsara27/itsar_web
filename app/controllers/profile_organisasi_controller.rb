class ProfileOrganisasiController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
	  @nama_btn = "Simpan"
	  @nama_form = " - Buat Profile Organisasi ITSAR"
	  @aksi_form = "create"
	  get_exist = TProfile.select('shortname_itsar').map(&:shortname_itsar)
	  @get_organization = TItsar.select('shortname, schname, gname').where('shortname NOT IN (?)', get_exist)
	  @op = "create"
	  @profile = TProfile.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
	  if params[:page].to_i > 1
	    @hhh = 15 * params[:page].to_i - 15
	  end
	end

	def show
		idprofile = TProfile.find(params[:id])
		@aa = "Profile #{idprofile.t_itsar.gname}, #{idprofile.t_itsar.schname}" 
		@bb = idprofile.self_profile.html_safe
	end

	def create
	  @a = params[:organisasi]
	  @b = params[:profile_input]
	  @c = session[:cur_id]
	  simpen = TProfile.create({:shortname_itsar => @a, :self_profile => @b, :t_user_id => @c})
	  if simpen.valid?
	    flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
	  else
		flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
	  end
	  if params[:page]
	    redirect_to "/profile_organisasi?page="+params[:page]
	  else
		redirect_to "/profile_organisasi"
	  end
	end

	def edit
		@nama_btn = "Perbaharui"
		@nama_form = " - Perbaharui Profile Organisasi ITSAR"
		@aksi_form = "#{params[:id]}/renew"
		@op = "edit"
		idprofile = TProfile.find(params[:id])
		@aa = "#{idprofile.t_itsar.gname}, #{idprofile.t_itsar.schname}" 
		@bb = idprofile.self_profile
	  	@profile = TProfile.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def renew
		idprofile = TProfile.find(params[:id])
		idprofile.self_profile = params[:profile_input]
		unless idprofile.save
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		else
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end
		redirect_to profile_organisasi_index_path
	end

	def delete
		idprofile = TProfile.find(params[:id])
		idprofile.destroy
		redirect_to profile_organisasi_index_path, :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end
end
