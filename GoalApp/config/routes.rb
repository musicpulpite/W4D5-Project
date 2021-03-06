Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  resources :goals, only: [:create, :show, :update, :delete]
end
