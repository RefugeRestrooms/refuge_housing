Rails.application.routes.draw do
  root "search#index"

  get "search/index", to: "search#index", as: "index"

  get "posts/new", to: "posts#new", as: "new"

  get "posts/:id", to: "posts#show", as: "posts"

  post "create", to: "posts#create", as: "create"

  get "success", to: "posts#success", as: "success"
end
