Rails.application.routes.draw do
	root :to => "pages#index"
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
	get ':controller(/:action(/:id))'
end
