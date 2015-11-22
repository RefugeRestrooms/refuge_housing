Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "posts#index"

  # Can we remove these in favor of using the flash, and redirecting?
  get "posts/success", to: "posts#success"
  get "validation_error", to: "posts#validation_error"

  resources :posts, except: [:edit] do
    member do
      constraints validation: /.{32}/ do
        get    "edit/:validation",    to: "posts#edit",    as: :edit
        get    "confirm/:validation", to: "posts#confirm", as: :confirm
      end

      get "confirm/:validation", to: "posts#validation_error" # if ^^^^ fails
    end
  end

  get "about", controller: "about"

  get "contact", to: "contacts#new"
  resources "contacts", only: [:new, :create]

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
