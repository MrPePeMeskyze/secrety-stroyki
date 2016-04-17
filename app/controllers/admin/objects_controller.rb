##############################################################################
#	
##############################################################################
class Admin::ObjectsController < Admin::AdminController
	before_action :all_objects, only: [:edit, :update, :new, :create]



##############################################################################
	def index
		if params[:parent_id]
			@objects = Objects.where("parent_id = ?", params[:parent_id])
		else
			@objects = Objects.where("parent_id = ?", 0).order('is_published desc, sort_order')
		end
	end


	
##############################################################################
	def new
		@object = Objects.new
	end


	
##############################################################################
	def create
		@object = Objects.new(objects_params)
	    if @object.save
	    	flash[:success] = "Страница успешно создана!"
	      	redirect_to admin_objects_path
	    else
	    	render :new
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
			flash[:success] = "Страница успешно отредактирована!"
			redirect_to admin_objects_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Objects.find_by_id(params[:id]).destroy
		flash[:success] = "Страница успешно удалена!"
		redirect_to admin_objects_path
	end


	
##############################################################################
	private

	    def objects_params
	      params.require(:objects)
	      	.permit(:parent_id, :is_published, :permalink, :header, :title, :body, :sort_order, :image, :meta_keywords, :meta_description, :additional_body )
	    end
		def all_objects
			if params[:id].present?
				@parents = Objects.where.not(:id => params[:id]).order(:thread_id, :sort_order)
			else
				@parents = Objects.all.order(:thread_id, :sort_order)
			end
		end
##############################################################################
end