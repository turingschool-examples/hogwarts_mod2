Rails.application.routes.draw do
  get "/", to: "welcome#index"
  resources :professors, :students
  resources :professor_students, only: [:create]
end
