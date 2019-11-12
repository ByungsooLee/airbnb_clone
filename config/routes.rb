Rails.application.routes.draw do
  get 'photos/create'
  root 'pages#home'
  resources :rooms do
    member do
      get :listing
      get :pricing
      get :description
      get :photos
      get :amenities
      get :location
    end
    resources :photos, only: [:create, :destroy]
  end
  devise_for :users,
              path:"",
              controllers:{ registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
end
