Rails.application.routes.draw do
  root "posts#index"

  get "posts/index", to: "posts#index"

  resources :posts

  get "confirm", to: "posts#confirm"

  get "delete", to: "posts#delete"

  get "success", to: "posts#success"

  get "validation_error", to: "posts#validation_error"

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
