Rails.application.routes.draw do
  get 'dogs/index'
  get 'dogs/show'
  get 'dogs/new'
  get 'dogs/create'
  get 'dogs/edit'
  get 'dogs/update'
  get 'dogs/destroy'
  get 'dogs/resources'
  devise_for :users
  root to: 'dogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "dashboard", to:'users#dashboard'

  resources :dogs do

    resources :rentings, only: :create

  end

end
