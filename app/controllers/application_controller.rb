class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :rebuild_routes
  def not_found
    render :template => '404', :status => 404
  end

  private
    def rebuild_routes
      Rails.application.routes_reloader.reload!
    end
end
