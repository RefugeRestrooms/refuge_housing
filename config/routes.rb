Rails.application.routes.draw do
  root "search#index"

  get "search/index", to: "search#index"

  resources :posts, only: [:new, :show, :create, :edit, :update]

  get "success", to: "posts#success"

  mount SubdivisionSelect::Engine, at: 'subdivisions'
end
