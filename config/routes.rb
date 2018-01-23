Rails.application.routes.draw do
  resources :guests, only: [:index, :show, :update, :destroy]
  resources :rsvps do
    resources :guests, only: [:create]
  end
end
