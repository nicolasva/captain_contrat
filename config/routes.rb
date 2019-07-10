Rails.application.routes.draw do
  resources :heros
  resources :ranks do
    resources :fights
  end
  #resources :shield
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
