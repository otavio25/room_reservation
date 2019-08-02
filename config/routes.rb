Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'users/index'
    resources :users
  end
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index' #dashboard
    resources :admins #administradores
    resources :rooms #salas
    resources :rents #aluguéis
  end
  devise_for :users
  devise_for :admins, skip: [:registrations]

  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
