Rails.application.routes.draw do

  resources :agents do
	  resources :projects
	end

	resources :projects do
	  resources :tasks
	end

end
