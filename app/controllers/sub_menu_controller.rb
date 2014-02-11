class SubMenuController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Sub Menu"
		@aksi_form = "save_sub"
		@idmenu = params[:id]
		gen_visible = TMenu.find(params[:id])
		array_visito = gen_visible.visible_to.split(',')
		visito = array_visito.join(',')
		count_visito = array_visito.count
		# visitob = visito.join(',')
		@records_role = TUsertype.find_by_sql('SELECT id, utypename FROM t_usertypes WHERE id IN ('+visito[1..count_visito]+')')
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@menu_query = TSubmenu.joins('LEFT JOIN t_users ON t_users.id = t_submenus.iduser').select("t_submenus.*, t_users.nme").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@menu_query = TSubmenu.joins('LEFT JOIN t_users ON t_users.id = t_submenus.iduser').select("t_submenus.*, t_users.nme").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_sub
		
	end
end
