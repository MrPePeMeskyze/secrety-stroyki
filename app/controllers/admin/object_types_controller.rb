##############################################################################
#	
##############################################################################
class Admin::ObjectTypesController < Admin::AdminController

	def index
		@object_types = ObjectTypes.all.order('sort_order, name')
	end


	
##############################################################################
	def new
		@object_type = ObjectTypes.new
	end


	
##############################################################################
	def create
		@object_type = ObjectTypes.new(object_types_params)
	    if @object_type.save
	    	flash[:success] = "Тип страницы успешно создан!"
	      	redirect_to admin_object_types_path
	    else
	    	render :new
		end	
	end
	

	
##############################################################################
	def edit
		@object_type = ObjectTypes.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@object_type = ObjectTypes.find_by_id(params[:id])
		if @object_type.update_attributes(object_types_params)
			flash[:success] = "Тип страницы успешно отредактирован!"
			redirect_to admin_object_types_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		ObjectTypes.find_by_id(params[:id]).destroy
		flash[:success] = "Тип страницы успешно удален!"
		redirect_to admin_object_types_path
	end


	
##############################################################################
	private

	    def object_types_params
	      params.require(:object_types)
	      	.permit(:name, :sort_order)
	    end

##############################################################################
end