Rails.application.routes.draw do
  get 'professors/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show'
end
