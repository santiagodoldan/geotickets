GeoTickets::Application.routes.draw do

  resources :tags


  resources :epics
  resources :tickets
  resources :worked_hours, only: [:create, :update]

  root :to => 'dashboard#index'

  resources :users, only: [:index, :destroy] do
    post 'select', on: :collection
  end

end
