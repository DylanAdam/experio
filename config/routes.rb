Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create, :destroy]
  end

  resources :bookings, only: [:index, :show, :index, :destroy] do
    resources :reviews, only: [:new, :create, :edit]
  end

  get 'manage', to: 'experiences#manage', as: :manage

end
