class PagesController < ApplicationController
 ##############################################################################
	def index
		@objects = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
	end


	
##############################################################################
	def pages
		@objects = Objects.find_by_full_path(params[:id])
	end


	
##############################################################################
end
