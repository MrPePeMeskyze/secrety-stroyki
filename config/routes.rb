Rails.application.routes.draw do
	# admin area
	get "/admin" => "admin/objects#index"
	namespace :admin do
	  resources :objects
	end
end
