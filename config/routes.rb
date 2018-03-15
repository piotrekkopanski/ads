Rails.application.routes.draw do

  root 'notifications#new'

  resources :notifications

end
