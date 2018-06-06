Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'cheeps#home'
  resources :cheeps do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create, :show]
end
