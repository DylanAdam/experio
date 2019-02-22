Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create, :destroy] do
      get 'payement', to: 'bookings#payement', as: :payement
      get 'accept', to: 'bookings#accept', as: :accept
      get 'decline', to: 'bookings#decline', as: :decline
    end
  end

  resources :bookings, only: [:index, :show, :index, :destroy] do
    resources :reviews, only: [:create]
  end
  get 'manage', to: 'experiences#manage', as: :manage

end
