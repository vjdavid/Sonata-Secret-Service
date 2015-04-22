Rails.application.routes.draw do

  resources :agents do
    resources :projects
 end

  resources :projects do
    resources :tasks
  end

  resources :projects do
    resources :agents
  end

end
