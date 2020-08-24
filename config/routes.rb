Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'  #portas de entrada da app
  get 'rentals/search', to: 'rentals#search'
  resources :car_categories, :car_models, :subsidiaries, :rentals, :clients, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
  
end
