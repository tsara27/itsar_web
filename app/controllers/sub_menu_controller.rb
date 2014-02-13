class SubMenuController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@aksi_form = "save_sub"
		@idmenu = params[:id]
		nama_menu = TMenu.find(@idmenu)
		@nama_form = " - Buat Sub Menu "+nama_menu.menu_name
		gen_visible = TMenu.find(params[:id])
		array_visito = gen_visible.visible_to.split(',')
		visito = array_visito.join(',')
		count_visito = array_visito.count
		@records_role = TUsertype.find([visito[1..count_visito]])
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@menu_query = TSubmenu.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@menu_query = TSubmenu.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
	end

	def save_sub
		@aa = params[:menu_id]
		@a = params[:name_menu]
		@b = params[:menu_url]
		@d = params[:role_id].join(',')
		@c = session[:cur_id]
		unless @a && @b.blank?
			if @c.blank?
				@simpen = TSubmenu.create({:t_menu_id => @aa,:menu_name => @a, :url => @b, :t_user_id => "", :visible_to =>","+@d+","})
			else
				@simpen = TSubmenu.create({:t_menu_id => @aa,:menu_name => @a, :url => @b, :t_user_id => @c, :visible_to =>","+@d+","})
			end
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		end

		if params[:page]
			redirect_to "/"+@aa+"/add-sub-menu?page="+params[:page]
		else
			redirect_to "/"+@aa+"/add-sub-menu/"
		end
	end

	def edit_sub
		@nama_btn = "Perbaharui"
		@idmenu = params[:id]
		nama_menu = TMenu.find(@idmenu)
		@nama_form = " - Perbaharui Sub Menu Dari "+nama_menu.menu_name
		@aksi_form = @idmenu+"/"+params[:idsub]+"/update_submenu"
		gen_visible = TMenu.find(params[:id])
		array_visito = gen_visible.visible_to.split(',')
		visito = array_visito.join(',')
		count_visito = array_visito.count
		@records_role = TUsertype.find([visito[1..count_visito]])
		submenu_dtl = TSubmenu.find(params[:idsub])
		@aa = submenu_dtl.menu_name
		@bb = submenu_dtl.url.to_s
		@cc = submenu_dtl.visible_to.split(',')
		@menu_query = TSubmenu.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def update_submenu
		menu_sub = TSubmenu.find(params[:idsub])
		menu_sub.menu_name = params[:name_menu]
		menu_sub.url = params[:menu_url]
		menu_sub.visible_to = ','+params[:role_id].join(',')+','
		menu_sub.save

		redirect_to "/"+params[:id]+"/add-sub-menu/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil diperbaharui.".html_safe
	end

	def delete_sub
		menu_sub = TSubmenu.find(params[:idsub])
		menu_sub.destroy
		redirect_to "/"+params[:id]+"/add-sub-menu/", :notice_success => "<b>Alhamdulillah!</b> Data berhasil dihapus.".html_safe
	end

	def search
		@nama_btn = "Simpan"
		@aksi_form = "save_sub"
		@idmenu = params[:id]
		nama_menu = TMenu.find(@idmenu)
		@nama_form = " - Buat Sub Menu "+nama_menu.menu_name
		gen_visible = TMenu.find(params[:id])
		array_visito = gen_visible.visible_to.split(',')
		visito = array_visito.join(',')
		count_visito = array_visito.count
		@records_role = TUsertype.find([visito[1..count_visito]])
		@a = params[:search_form]
		if params[:page].to_i > 1
			# @jlm_offset = 15 * params[:page].to_i
			@hhh = 15 * params[:page].to_i - 15
			# @usr = TUsertype.limit(15).offset(@jlm_offset).paginate(:page => params[:page], :per_page => 15)
			@menu_query = TSubmenu.where("menu_name LIKE ?","%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		else
			@menu_query = TSubmenu.where("menu_name LIKE ?","%"+@a+"%").order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		end
		render :index
	end
end
