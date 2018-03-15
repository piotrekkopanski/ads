Rails.application.routes.draw do

  root 'notifications#new'

  resources :notifications, except: [:edit]

end
