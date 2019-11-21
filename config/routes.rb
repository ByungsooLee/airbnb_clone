Rails.application.routes.draw do
  root 'pages#home'
  resources :rooms do
    member do
      get :listing
      get :pricing
      get :description
      get :photos
      get :amenities
      get :location
      get :preload
      get :preview
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end
  devise_for :users,
              path:"",
              controllers:{ registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  get 'trips', to: 'reservations#trips'
  get 'reservations', to: 'reservations#reservations'
end
