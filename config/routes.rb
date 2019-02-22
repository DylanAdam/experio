Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create, :destroy] do
      get 'payement', to: 'bookings#payement', as: :payement
    end
  end

  # put '/bookings/:id/accept', to: 'bookings#accept', as: :accept
  # put '/bookings/:id/decline', to: 'bookings#decline', as: :decline
  resources :bookings, only: [:index, :show, :index, :destroy, :edit] do
    resources :reviews, only: [:new, :create, :edit]
    member do
      put :accept
      put :decline
    end
  end
  get 'manage', to: 'experiences#manage', as: :manage

end
