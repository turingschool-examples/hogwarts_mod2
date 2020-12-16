Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#professors
  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show'

#students
  get '/students', to: 'students#index'
end
