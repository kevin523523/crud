Rails.application.routes.draw do
  root to: 'accounts#index'
  
  resources :accounts do
    resources :courses do
      resources :assignments
    end
  end
end
