Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'themes/news/:id', to: "news#show"
    get 'themes/:id', to: "themes#show"
    devise_for :users
    get 'static_pages/landing_page'
    # get 'static_pages/dashboard'
    post '/themes/news/show', to: "news#show_comments"
    post '/themes/news/new', to: "news#new_comment"
    post '/themes/news/create_comment', to: "news#create_comment"
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root "static_pages#landing_page"
  end 
end
