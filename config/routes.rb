Rails.application.routes.draw do

  resources :agents do
	  resources :proyects
	end

	resources :proyects do
	  resources :tasks
	end

end
