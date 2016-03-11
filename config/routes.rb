Rails.application.routes.draw do
  resources :tools

  get '/tools/random', to: 'tools#random', as: :random_tool
end
