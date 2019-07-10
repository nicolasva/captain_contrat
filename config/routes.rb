Rails.application.routes.draw do
  resources :heros
  resources :fights, except: :new
  resources :ranks, except: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :fights, only: :new
  end
  #resources :shield
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
