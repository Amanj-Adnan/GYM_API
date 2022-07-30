Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "users#index"
  namespace :api do
    namespace :v1 do
      namespace :auth do
      get "users" ,to: "users#index"
      post "user" ,to: "registrations#create"
      post "user/login" ,to: "sessions#create"
      end
      
      get "user/user_info", to:"user_infos#show"
      post "user/user_info", to:"user_infos#create"
      put "user/user_info", to:"user_infos#update"
      
      get "user/subscriptions", to:"user_subscriptions#index"
      get "user/subscription", to:"user_subscriptions#show"
      post "user/subscription", to:"user_subscriptions#create"
      put "user/subscription", to:"user_subscriptions#update"
    end
  end
end
