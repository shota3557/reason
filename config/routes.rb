Rails.application.routes.draw do
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'tasks#index'
  resources :tasks, except: [:show] do
    resources :causes
    collection do
      get :favorites, only: [:create, :destroy]
    end
  end  
  resources :favorites, only: [:create, :destroy, :index]
  resources :users, only: [:show, :index]
end