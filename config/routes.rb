Rails.application.routes.draw do
  resources :products
  devise_for :users
  root 'groups#index'
  resources :users, only: [:show, :edit, :update, :index]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages
  end

end
