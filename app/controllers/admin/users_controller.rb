##############################################################################
#	
##############################################################################
class Admin::UsersController < Admin::AdminController

	def index
		@users = Users.all.order('is_published DESC, is_admin DESC, login')
	end


	
##############################################################################
	def new
		@user = Users.new
	end


	
##############################################################################
	def create
		@user = Users.new(users_params)
	    if @user.save
	    	flash[:success] = "Пользователь успешно создан!"
	      	redirect_to admin_users_path
	    else
	    	render :new
		end	
	end
	

	
##############################################################################
	def edit
		@user = Users.find_by_id(params[:id])
	end


	
##############################################################################
	def update
		@user = Users.find_by_id(params[:id])
		if @user.update_attributes(users_params)
			flash[:success] = "Пользователь успешно отредактирован!"
			redirect_to admin_users_path
		else
			render :edit
		end
	end


	
##############################################################################
	def destroy
		Users.find_by_id(params[:id]).destroy
		flash[:success] = "Пользователь успешно удален!"
		redirect_to admin_users_path
	end


	
##############################################################################
	private

	    def users_params
	      params.require(:users)
	      	.permit(:login, :is_admin, :password_confirmation, :is_published, :email, :name, :password, :middle_name, :last_name)
	    end

##############################################################################
end