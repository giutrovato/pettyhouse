Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create]
  end
  resources :bookings, except: [:create]

  resources :pets

  get "my_profile", to: "pages#my_profile"
end
