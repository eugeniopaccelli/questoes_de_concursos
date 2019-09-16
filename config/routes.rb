Rails.application.routes.draw do
  
  namespace :profiles_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :profiles
  devise_for :admins
  get 'welcome/index'

  root 'welcome#index'
  
end
