class SubMenuController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@aksi_form = "save_sub"
		@idmenu = params[:id]
		nama_menu = TMenu.find(@idmenu)
		@nama_form = " - Buat Sub Menu "+nama_menu.menu_name
		gen_visible = TMenu.select('visible_to').where(:id => params[:id]).map(&:visible_to)
		array_visito = gen_visible.split(',')
		visito = array_visito.join(',').from(1)
		len = visito.length - 2
		visible = visito.at(0..len).split(',')
		@records_role = TUsertype.find([visible])
		@menu_query = TSubmenu.where(:t_menu_id => @idmenu).order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
	end

	def save_sub
		@aa = params[:menu_id]
		@a = params[:name_menu]
		@b = params[:menu_url]
		@d = params[:role_id]
		@c = session[:cur_id]
		@d = (@d.blank?) ? "0" : params[:role_id].join(',')
		simpen = TSubmenu.create({:t_menu_id => @aa,:menu_name => @a, :url => @b, :t_user_id => @c, :visible_to =>","+@d+","})
		if simpen.valid?
			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		else
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
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
		gen_visible = TMenu.select('visible_to').where(:id => params[:id]).map(&:visible_to)
		array_visito = gen_visible.split(',')
		visito = array_visito.join(',').from(1)
		len = visito.length - 2
		visible = visito.at(0..len).split(',')
		@records_role = TUsertype.find([visible])
		submenu_dtl = TSubmenu.find(params[:idsub])
		@aa = submenu_dtl.menu_name
		@bb = submenu_dtl.url.to_s
		@cc = submenu_dtl.visible_to.split(',')
		@menu_query = TSubmenu.where(:t_menu_id => @idmenu).order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		render :index
	end

	def update_submenu
		menu_sub = TSubmenu.find(params[:idsub])
		menu_sub.menu_name = params[:name_menu]
		menu_sub.url = params[:menu_url]
		d = params[:role_id]
		d = (d.blank?) ? "0" : params[:role_id].join(',')
		menu_sub.visible_to = ','+d+','
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
		gen_visible = TMenu.select('visible_to').where(:id => params[:id]).map(&:visible_to)
		array_visito = gen_visible.split(',')
		visito = array_visito.join(',').from(1)
		len = visito.length - 2
		visible = visito.at(0..len).split(',')
		@records_role = TUsertype.find([visible])
		@a = params[:search_form]
		@menu_query = TSubmenu.where("menu_name LIKE ? AND t_menu_id = ?","%"+@a+"%",@idmenu).order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
		render :index
	end
end
