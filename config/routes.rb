Rails.application.routes.draw do
  root to: 'cheeps#home'
  resources :cheeps do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:new, :create]
end
