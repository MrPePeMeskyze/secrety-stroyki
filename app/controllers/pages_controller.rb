class PagesController < ApplicationController
	before_action :init
##############################################################################
	def index
		@objects = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
	end


	
##############################################################################
	def pages
		@objects = Objects.find_by_full_path(params[:id])
	end



##############################################################################

	private
		def init
			## TODO: Перехват на 404, вызов exception
			if(!params[:id])
				@object = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
			else
				@object = Objects.find_by(full_path: params[:id], is_published: 1)
			end
			if(@object.blank?)
				render :template => '404', :status => 404
			end
		end
end
