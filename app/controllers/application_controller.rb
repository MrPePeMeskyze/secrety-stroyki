class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :rebuild_routes, :session_start
  def not_found
    render :template => '404', :status => 404
  end

  private
    def rebuild_routes
      Rails.application.routes_reloader.reload!
    end
end
