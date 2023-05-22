Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :parcels, only: [:index, :new] do
    collection do
      get :withdraw
    end
    member do
      put :book_train
    end
  end
  resources :trains do
    # get :add_parcels
    get 'add_parcels/:parcel', action: :add_parcels, on: :member, as: :add_parcels
  end
  resources :lines 
  #get '/book_train' , to: "parcels#book_train"
  # put '/parcels/:id/book_train', to: "parcels#book_train"

end
