Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}

  namespace :api do
    namespace :v1 do
      resources :loans, defaults: { format: 'json' }
      resources :payments, defaults: { format: 'json' }
    end
  end

end
