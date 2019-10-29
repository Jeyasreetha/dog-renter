Rails.application.routes.draw do
  devise_for :users
  # localhost3000/
  root to: 'dogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # profile page for the users (owners and renters) ???
  get 'dashboard', to:'users#dashboard'

  # CRUD
  resources :dogs do
  # If only there is a dog you could rent
    resources :rentings, only: :create

  end

end
