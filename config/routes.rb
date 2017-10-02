Rails.application.routes.draw do
  resources :images, only: :index do
    collection do
      get "lazyload"
      get "progressive_load"
    end
  end
  resources :test_variants, only: [:index]
  root to: "images#index"

  match '/404', to: 'error/errors#not_found', via: :all
  match '/500', to: 'error/errors#internal_server_error', via: :all
end
