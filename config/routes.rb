Rails.application.routes.draw do
  root "posts#index"

  get "posts/delete", to: "posts#delete"
  get "posts/confirm", to: "posts#confirm"
  get "posts/success", to: "posts#success"
  resources :posts

  get "validation_error", to: "posts#validation_error"

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
