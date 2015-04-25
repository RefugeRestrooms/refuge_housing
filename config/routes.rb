Rails.application.routes.draw do
  get "search/index"
  root "search#index"

  # get 'search' => 'search'

  # get "posts"
  # get 'posts/:id' => 'catalog#view'
end
