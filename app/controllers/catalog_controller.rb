class CatalogController < ApplicationController
	before_filter :init
##############################################################################
	def index
	end


	
##############################################################################
	def category	
	end


	
##############################################################################
	def catalog_pages
		if(@catalog_page.objects_type_id = 6)
			render template: "catalog/group"
		else
			if(@catalog_page.objects_type = 7)
				render template: "catalog/type"
			end
		end
	end



##############################################################################
	public
		def init
			@catalog_page = Objects.find_by(full_path: params[:id], is_published: 1)
			
			## Перехват на 404, вызов exception
			if(@catalog_page.blank?)
				render :template => '404', :status => 404
			end
		end
end
