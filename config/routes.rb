Rails.application.routes.draw do
  get "search/index"
  root "search#index"

  # get 'search' => 'search'

  get 'posts/:id', to: 'posts#show', as: 'post'
end
