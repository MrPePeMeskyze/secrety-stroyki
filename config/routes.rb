Rails.application.routes.draw do
	# admin area
	get "/admin" => "admin/object#index"
	namespace :admin do
	  resources :object
	end
end
