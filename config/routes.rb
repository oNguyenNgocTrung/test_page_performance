Rails.application.routes.draw do
  resources :images, only: :index do
    collection do
      get "lazyload"
      get "progressive_load"
    end
  end
  root to: "images#index"
end
