Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  resources :tasks
  patch 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  # get '/tasks', to: 'tasks#index'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # post '/tasks', to: 'tasks#create'

  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  # get '/tasks/'

end
