Rails.application.routes.draw do
  #professors
  get '/professors', to: 'professors#index'
end
