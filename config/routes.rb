Rails.application.routes.draw do
  get 'rentings/create'
  devise_for :users, :controllers => { registrations: :registrations }
  # localhost3000/
  root to: 'dogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # profile page for the users (owners and renters) ???
  get 'dashboard', to:'pages#dashboard'
  get 'dashboard/edit', to: "pages#dashboard_edit"
  # CRUD
  resources :dogs do
  # If only there is a dog you could rent
    resources :rentings, only: :create

  end

end
