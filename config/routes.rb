Todo::Application.routes.draw do
  resources :users do
    resources :lists, except: [:index]
  end

  resources :lists do
    resources :items, only: [:create, :new]
  end

  resources :items, only: [:destroy]

  root to: 'users#new'

  namespace :api, defaults: { format: :json } do
    resources :users, except: [:new, :edit] do
      resources :lists, except: [:new, :edit, :index]
    end

    resources :lists, only: [:index]

    resources :sessions, only: [:create, :destroy]
  end
end
