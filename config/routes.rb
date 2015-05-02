Rails.application.routes.draw do
  root "posts#index"

  get "posts/index", to: "posts#index"

  resources :posts

  get "confirm", to: "posts#confirm"

  get "success", to: "posts#success"

  get "confirm_success", to: "posts#confirm_success"

  get "destroy_success", to: "posts#destroy_success"

  get "error/validation", to: "error#validation"

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
