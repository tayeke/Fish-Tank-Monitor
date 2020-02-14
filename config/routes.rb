Rails.application.routes.draw do
  resources :temperatures do
    get :current, on: :collection
  end
  resources :tests do
    get :current, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
