Rails.application.routes.draw do

  scope "(:locale)", locale: /en|pl/ do
    root 'notifications#new'
    resources :notifications, except: [:edit]
  end

end
