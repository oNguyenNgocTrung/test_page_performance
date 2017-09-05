Rails.application.routes.draw do
  resources :images, only: :index do
    collection do
      get "lazyload"
      get "progressive_load"
    end
  end
  resources :test_variants, only: [:index]
  root to: "images#index"
end
