Todo::Application.routes.draw do
  get "static/home"

  root to: 'static#home'

  namespace :api, defaults: { format: :json } do
    resources :users, except: [:new, :edit] do
      resources :lists, except: [:new, :edit, :index]
    end

    resources :lists, only: [:index] do
      resources :items, except: [:new, :edit]
    end

    resources :sessions, only: [:create, :destroy]
  end
end
