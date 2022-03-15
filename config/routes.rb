Rails.application.routes.draw do

  root to: "pages#home"

  get '/hello-world', to: 'pages#hello_world'
end
