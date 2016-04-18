##############################################################################
#	
##############################################################################
class Admin::NavigationsController < Admin::AdminController

	def index
		@navigations = Navigations.all.order('sort_order, description')
	end


	
##############################################################################
	def new
		@navigation = Navigations.new
	end


	
##############################################################################
	def create
		@navigation = Navigations.new(navigations_params)
	    if @navigation.save
	    	flash[:success] = "Навигатор успешно создан!"
	      	redirect_to admin_navigations_path
	    else
	    	render :new
		end	
	end
	

	
##############################################################################
	def edit
		@navigation = Navigations.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@navigation = Navigations.find_by_id(params[:id])
		if @navigation.update_attributes(navigations_params)
			flash[:success] = "Навигатор успешно отредактирован!"
			redirect_to admin_navigations_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Navigations.find_by_id(params[:id]).destroy
		flash[:success] = "Навигатор успешно удален!"
		redirect_to admin_navigations_path
	end


	
##############################################################################
	private

	    def navigations_params
	      params.require(:navigations)
	      	.permit(:name, :description, :sort_order)
	    end

##############################################################################
end