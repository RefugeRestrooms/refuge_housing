Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "posts#index"

  # Can we remove these in favor of using the flash, and redirecting?
  get "posts/success", to: "posts#success"
  get "validation_error", to: "posts#validation_error"

  resources :posts do
    member do
      get "confirm/:validation", to: "posts#confirm",
                                 as: :confirm,
                                 constraints: { validation: /.{32}/ }
    end
  end

  get "about", controller: "about"

  get "contact", to: "contacts#new"
  resources "contacts", only: [:new, :create]

  mount SubdivisionSelect::Engine, at: "subdivisions"
end
