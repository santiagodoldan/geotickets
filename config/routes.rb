GeoTickets::Application.routes.draw do

  root to: 'dashboard#index'

  get :login, to: 'dashboard#index'

  resources :sprints do
    get :active, on: :collection

    resources :stories, except: [:new, :edit]
    resources :tickets, only: [:index]
    resources :worked_hours, only: [:index]
  end

  resources :stories, only: [] do
    resources :tickets, except: [:new, :edit]
  end

  resources :worked_hours
  resources :tags

  resources :users do
    post :login, on: :member
    delete :logout, on: :collection
    get :logged_in_user, on: :collection
  end

end
