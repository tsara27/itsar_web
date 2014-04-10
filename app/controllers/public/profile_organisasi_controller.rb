class Public::ProfileOrganisasiController < ApplicationController
	layout "public_layout"
	def show
		get_profile = TProfile.find_by_shortname_itsar(params[:shortname])
		unless get_profile.blank?
		  @orgsch = "Profile #{get_profile.t_itsar.gname}, #{get_profile.t_itsar.schname}" 
		  @profile = get_profile.self_profile.html_safe
		end
	end
end