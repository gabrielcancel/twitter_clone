Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tweets
  get 'tweets/search'

  # Defines the root path route ("/")
  root "tweets#index"
end
