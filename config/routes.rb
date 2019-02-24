Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			#get "hello", to: "products#hello_world"
			#get "products", to: "products#index"
			#post "products", to: "products#create"
			#delete "products/:id", to: "products#destroy"
			#put "products/:id", to: "products#update"
			#get "products/:id", to: "products#show"

			resources :products do #mesma função das linhas de cima

				resources :pieces

			end
		end
	end  
end
