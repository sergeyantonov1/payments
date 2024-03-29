Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root to: "pages#home"
end
