class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :init

  private
  	def init
  	## TODO: Перехват на 404, вызов exception
  	end
end
