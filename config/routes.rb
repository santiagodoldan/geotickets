GeoTickets::Application.routes.draw do

  root to: 'dashboard#index'

  resources :users
  resources :tags
  resources :tickets
  resources :worked_hours

  resources :epics, except: [:new, :edit] do
    resources :tickets, except: [:show, :new, :edit]
  end

end
