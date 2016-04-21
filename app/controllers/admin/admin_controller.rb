class Admin::AdminController < ActionController::Base
	include ApplicationHelper
	before_filter :session_start, :authenticate
	layout "admin/layouts/admin"

	private
		def authenticate
	  		if(@oUser.blank?)
				redirect_to admin_logon_path
			else
				if(@oUser.is_admin.blank? || @oUser.is_published.blank?)
					sign_out
					redirect_to admin_logon_path
				end
			end
		end
end