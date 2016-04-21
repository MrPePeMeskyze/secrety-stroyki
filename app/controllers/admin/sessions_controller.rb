##############################################################################
#	
##############################################################################
class Admin::SessionsController < Admin::AdminController
	skip_before_filter :authenticate, :logon
	layout "admin/layouts/session"

	def logon
		if(params[:authenticity_token] && params[:users])
			## попытка логина пользователя ##
			sign_in(params[:users][:login], params[:users][:password])
		end
		if(!@oUser.blank?)
			## пишем имя в cookie ##
			cookies.permanent[:user_name] = @oUser.login

			redirect_to "/admin"
		end
		if(params[:authenticity_token] && @oUser.blank?)
			@authenticate_errors = true
		end
	end


	
##############################################################################
	def logout
		sign_out
		redirect_to :back
	end


	
##############################################################################s
end