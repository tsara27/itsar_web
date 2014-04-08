class ProfileOrganisasiController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
	  @nama_btn = "Simpan"
	  @nama_form = " - Buat Profile Organisasi ITSAR"
	  @aksi_form = "create"
	  get_exist = TProfile.select('shortname_itsar')
	  if(get_exist.exists?)
	  	get_exist.each do |row|
	      @coba = (get_exist.exists?) ? row.shortname_itsar.join(",") : "0"
	  	end
	  else
	  	@coba = "";
	  end
	  
	  @get_organization = TItsar.select('shortname, schname, gname').where('shortname NOT IN (?)', @coba)
	  @itsar_grp = TProfile.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
	  if params[:page].to_i > 1
	    @hhh = 15 * params[:page].to_i - 15
	  end
	end
end
