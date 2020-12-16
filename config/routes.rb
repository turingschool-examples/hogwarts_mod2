Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/professors', to: 'professors#index', as: "professors_index"
  get '/professors/:id', to: 'professors#show'

  get '/students', to: 'students#index', as: "students_index"
  get '/students/:id', to: 'students#show'
end
