class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def not_found
    render :template => '404', :status => 404
  end
end
