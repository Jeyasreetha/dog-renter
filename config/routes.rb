Rails.application.routes.draw do
  get 'rentings/create'
  devise_for :users
  root to: 'dogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "dashboard", to:'users#dashboard'

  resources :dogs do

    resources :rentings, only: :create

  end

end
