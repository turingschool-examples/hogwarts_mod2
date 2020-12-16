Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Professors
  get "/professors", to: "professors#index"
  get "/professors/:id", to: "professors#show", as: :professors_show

  #Students
  get "/students", to: "students#index"
  get "/students/:id", to: "students#show", as: :students_show
end
