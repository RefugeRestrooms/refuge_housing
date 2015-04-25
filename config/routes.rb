Rails.application.routes.draw do
  get "search/index"
  root "search#index"

  get "posts/new", to: "posts#new", as: "new"

  get "posts/:id", to: "posts#show", as: "posts"

  post "create", to: "posts#create", as: "create"

  get "success", to: "posts#success", as: "success"
end
