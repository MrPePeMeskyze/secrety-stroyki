##############################################################################
#	
##############################################################################
class Admin::ObjectsController < Admin::AdminController

	def index
		@objects = Objects.where("parent_id = ?", 0).order(:is_published, :sort_order)
#		render :text => CGI.escapeHTML(@objects.inspect)
	end


	
##############################################################################
	def new
		@object = Objects.new
	end


	
##############################################################################
	def create
		@object = Objects.new(objects_params)
	    if @object.save
	    	flash[:success] = "Услуга успешно создана!"
	      	redirect_to admin_objects_path
	    else
	    	render 'new'
		end	
	end
	

	
##############################################################################
	def edit
		@object = Objects.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@object = Objects.find_by_id(params[:id])
		if @object.update_attributes(objects_params)
			flash[:success] = "Услуга успешно отредактированна"
			redirect_to admin_objects_path
		else
			render 'edit'
		end
	end


	
##############################################################################
	def destroy
		Objects.find_by_permalink(params[:id]).destroy
		flash[:success] = "Услуга успешно удалена!"
		redirect_to admin_objects_path
	end


	
##############################################################################
	private

	    def objects_params
	      params.require(:objects)
	      	.permit(:parent_id, :is_published, :permalink, :header, :title, :body, :sort_order, :image, :meta_keywords, :meta_description, :additional_body )
	    end
	
##############################################################################
end