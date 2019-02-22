Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create, :destroy] do
      get 'payement', to: 'bookings#payement', as: :payement
    end
  end

  resources :bookings, only: [:index, :show, :index, :destroy] do
    resources :reviews, only: [:create]
  end

  get 'manage', to: 'experiences#manage', as: :manage

end
