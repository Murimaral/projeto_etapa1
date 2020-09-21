Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'  #portas de entrada da app
  #get 'rentals/search', to: 'rentals#search'
  resources :car_categories, :car_models, :subsidiaries, :clients, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
  resources :rentals do
    resources :car_rentals
    get 'search', on: :collection
  end
  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[index]

    end
     
  end
  
end
