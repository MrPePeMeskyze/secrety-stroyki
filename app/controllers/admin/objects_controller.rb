##############################################################################
#	
##############################################################################
class Admin::ObjectsController < Admin::AdminController
	before_action :objects_ext, only: [:edit, :update, :new, :create]


	def index
		if params[:parent_id]
			@objects = Objects.where("parent_id = ?", params[:parent_id]).order('is_published desc, sort_order')
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
		@object.auser_id = @oUser.id
	    if @object.save
	    	flash[:success] = "Страница успешно создана!"
	      	redirect_to admin_objects_path(parent_id: @object.parent_id)
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
		@object.auser_id = @oUser.id
		if @object.update_attributes(objects_params)
			flash[:success] = "Страница успешно отредактирована!"
			redirect_to admin_objects_path(parent_id: @object.parent_id)
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
	      	.permit(:parent_id, :is_published, :permalink, :header, :objects_type_id, :title, :body, :sort_order, :image, :meta_keywords, :meta_description, :additional_body, navigation_ids:[])
	    end
		def objects_ext
			if params[:id].present?
				@parents = Objects.where.not(:id => params[:id]).order(:thread_id, :sort_order)
			else
				@parents = Objects.all.order(:thread_id, :sort_order)
			end
			@objects_types = ObjectsTypes.all.order(:sort_order, :name)
			@navigations = Navigations.all.order(:sort_order, :description)
		end
##############################################################################
end