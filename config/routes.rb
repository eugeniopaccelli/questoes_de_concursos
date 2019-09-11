Rails.application.routes.draw do
  
  devise_for :profiles
  devise_for :admins
  get 'welcome/index'

  root 'welcome#index'
  
end
