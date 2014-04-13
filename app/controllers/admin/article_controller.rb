class Admin::ArticleController < ApplicationController
	before_filter :check_login
	layout "admin_layout"
	def index
		@nama_btn = "Simpan"
		@nama_form = " - Buat Artikel"
		@aksi_form = "create"
		@get_type = TType.order('article_type ASC')
		@articles = TArticle.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
		if params[:page].to_i > 1
			@hhh = 15 * params[:page].to_i - 15
		end
	end

	def create
		a = params[:the_title]
		b = params[:the_text]
		c = session[:cur_id]
		d = params[:the_writer]
		e = params[:the_tag]
		f = params[:the_type]
		article = TArticle.new({:title => a, :the_text => b, :t_user_id => c, :writer => d, :t_type_id => f})
		tags = e.split(", ")
		if article.valid?
			article.save
			get_article_id = TArticle.find(article)
			tags.each do |tag|
  				the_tag = TTag.new(:tag => tag, :t_user_id => c)
  				if the_tag.valid?
  					the_tag.save
  					get_tag_id = TTag.find_by_tag([tag])
  					ids = get_tag_id.id
  					idss = ids.split(",")
  					idss.each do |key|
	  					TArticleRelation.create(:t_article_id => get_article_id.id, :t_tag_id => key)
	  				end
  				else
  					get_tag_id = TTag.find_by_tag(tag)
  					ids = get_tag_id.id
  					TArticleRelation.create(:t_article_id => get_article_id.id, :t_tag_id => ids)
  				end
			end

			flash[:notice_success] = "<b>Alhamdulillah!</b> Data berhasil disimpan.".html_safe
		else
			flash[:notice_failed] = "<b>Terdapat kesalahan pada pengisian form.</b>".html_safe
		end
		if params[:page]
			redirect_to "/article?page="+params[:page]
		else
			redirect_to article_index_path
		end
	end
end

