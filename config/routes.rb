Rails.application.routes.draw do
  root "search#index"

  get "search/index", to: "search#index"

  resources :posts, only: [:new, :show, :create]

  get "success", to: "posts#success"
end
