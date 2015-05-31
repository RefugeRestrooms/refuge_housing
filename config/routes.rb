Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "posts#index"

  get "posts/delete", to: "posts#delete"
  get "posts/confirm", to: "posts#confirm"
  get "posts/success", to: "posts#success"
  resources :posts

  get "validation_error", to: "posts#validation_error"

  get "about", to: "about"

  get "contact", to: "contacts#new"
  resources "contacts", only: [:new, :create]

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
