Rails.application.routes.draw do

  root to: 'tasks#index'
  
  resources :tasks
  
  #UserのRoute追加
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  #asを利用してFile_pathを変更できる?

  
  
end
