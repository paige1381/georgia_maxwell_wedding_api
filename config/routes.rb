Rails.application.routes.draw do
  resources :guests, only: [:index, :show, :update, :destroy, :attending, :notAttending] do
    collection do
      get 'attending', to: 'guests#attending'
      get 'notAttending', to: 'guests#notAttending'
    end
  end

  resources :rsvps do
    resources :guests, only: [:create]
  end

  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
end
