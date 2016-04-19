class PagesController < ApplicationController
 ##############################################################################
	def index
		@objects = Objects.where("parent_id = ? AND is_published = ?", 0, 1).order("sort_order ASC").first
	end


	
##############################################################################
	def pages
		@objects = Objects.where("is_published = ? AND object_type = ?", 0, 3).order("sort_order ASC").first
	end


	
##############################################################################
end
