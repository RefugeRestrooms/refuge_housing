Rails.application.routes.draw do
  root "search#index"

  get "search/index", to: "search#index"

  resources :posts, only: [:new, :show, :create, :edit, :update, :delete, :confirm]

  get "success", to: "posts#success"

  get "confirm/success", to: "posts#confirm_success"

  get "error", to: "error"

  get "error/validation", to: "error#validation"

  mount SubdivisionSelect::Engine, at: 'subdivisions'
end
