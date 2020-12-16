Rails.application.routes.draw do
  resources :professors, :students
  resources :professor_students, only: [:create]

end
