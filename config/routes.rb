Rails.application.routes.draw do
  root to: 'home#index'  #portas de entrada da app
  resources :car_categories, :car_models, :subsidiaries, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
end
