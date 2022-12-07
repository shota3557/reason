Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'tasks#index'
  resources :tasks, except: [:show] do
    resources :causes
    collection do
      get :favorites, only: [:create, :destroy]
    end
  end  
  resources :favorites, only: [:create, :destroy, :index]
end