Rails.application.routes.draw do
	# admin area
	get "/admin" => "admin/objects#index"
	namespace :admin do
	  resources :objects
	end
	namespace :admin do
	  resources :objects_types
	end
	namespace :admin do
	  resources :navigations
	end
end
