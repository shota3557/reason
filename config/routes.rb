Rails.application.routes.draw do
  resources :causes
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'tasks#index'
  resources :tasks, except: [:show] do
    collection do
      get :favorites, only: [:create, :destroy]
    end
  end  
  resources :favorites, only: [:create, :destroy, :index]
end