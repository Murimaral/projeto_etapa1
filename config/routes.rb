Rails.application.routes.draw do
  root to: 'home#index'  #portas de entrada da app
  resources :car_categories, :subsidiaries, only: [:index, :new, :show, :create] 
end
