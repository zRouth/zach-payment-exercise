Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}

  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      resources :payments, only: [:index, :show, :create]
      resources :loans, only: [:index, :show]
    end
  end

end
