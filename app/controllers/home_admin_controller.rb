class HomeAdminController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		
	end
end
