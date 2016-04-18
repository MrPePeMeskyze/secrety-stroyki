##############################################################################
#	
##############################################################################
class Admin::ObjectsTypesController < Admin::AdminController

	def index
		@objects_types = ObjectsTypes.all.order('sort_order, name')
	end


	
##############################################################################
	def new
		@objects_type = ObjectsTypes.new
	end


	
##############################################################################
	def create
		@objects_type = ObjectsTypes.new(objects_types_params)
	    if @objects_type.save
	    	flash[:success] = "Тип страницы успешно создан!"
	      	redirect_to admin_objects_types_path
	    else
	    	render :new
		end	
	end
	

	
##############################################################################
	def edit
		@objects_type = ObjectsTypes.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@objects_type = ObjectsTypes.find_by_id(params[:id])
		if @objects_type.update_attributes(objects_types_params)
			flash[:success] = "Тип страницы успешно отредактирован!"
			redirect_to admin_objects_types_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		ObjectsTypes.find_by_id(params[:id]).destroy
		flash[:success] = "Тип страницы успешно удален!"
		redirect_to admin_objects_types_path
	end


	
##############################################################################
	private

	    def objects_types_params
	      params.require(:objects_types)
	      	.permit(:name, :sort_order)
	    end

##############################################################################
end