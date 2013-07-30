GeoTickets::Application.routes.draw do

  root to: 'dashboard#index'

  resources :tags
  resources :epics
  resources :tickets
  resources :worked_hours

  resources :users do
    post 'select', on: :collection
  end

end
