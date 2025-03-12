Rails.application.routes.draw do
  resources :links
  resources :views, path: :v, only: [:show]

  root "links#index"
end
