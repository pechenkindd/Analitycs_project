Rails.application.routes.draw do
  get 'themes/news/:id', to: "news#show"
  get 'themes/:id', to: "themes#show"
  devise_for :users
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#landing_page"
end
