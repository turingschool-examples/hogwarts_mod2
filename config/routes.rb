Rails.application.routes.draw do
  #professors
  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show'
  get '/students', to: 'students#index'
end
