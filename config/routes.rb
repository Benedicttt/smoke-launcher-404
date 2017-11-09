require "que/web"

Rails.application.routes.draw do
  mount ActionCable.server, at: '*'
  mount Que::Web => "/que"

  root to: redirect("/homepage")
  get 'homepage' , to: 'homepage#homepage'

  resources :users
  resources :reports_users

  resources :partners
  resources :reports_partner

  namespace :homepage do
    get 'api_request' , to: 'api_request#api_request'
    post 'api_request', to: 'api_request#create'
    post 'api_request', to: 'api_request#api_request'

    get 'need_link' , to: 'need_link#need_link'

    post 'status_code_pages', to: 'status_code_pages#create'
    get 'status_code_pages', to: 'status_code_pages#status_code_pages'

    get 'select_binomo', to: 'select_binomo#select'
    get 'select_binpartner', to: 'select_binpartner#select'

    get 'deploy/branch', to: 'branch#branch'
    post 'deploy/branch', to: 'branch#create'
  end

  namespace :binpartner do
    get 'trader_for_partner', to: 'trader_for_partner#trader_for_partner'
    post 'trader_for_partner', to: 'trader_for_partner#create'

    get 'smoke_binpartner' , to: 'smoke_binpartner#smoke_binpartner'
    post 'smoke_binpartner', to: 'smoke_binpartner#create'
  end

  namespace :binomo do
    get 'assets', to: 'assets#assets'
    post 'assets', to: 'assets#create'

    get 'screen_shots', to: 'screen_shots#screen_shots'
    post 'screen_shots', to: 'screen_shots#create'

    get 'tournaments', to: 'tournaments#tournaments'
    post 'tournaments', to: 'tournaments#create'

    get 'smoke_binomo', to: 'smoke_binomo#smoke_binomo'
    post 'smoke_binomo', to: 'smoke_binomo#create'

    get 'smoke_prod', to: 'smoke_prod#smoke_prod'
    post 'smoke_prod', to: 'smoke_prod#create'

    get 'push_notify', to: 'push_notify#push_notify'
    post 'push_notify', to: 'push_notify#create'

    get 'email_marketing', to: 'email_marketing#email_marketing'
    post 'email_marketing', to: 'email_marketing#create'

    get 'recovery_password', to: 'recovery_password#recovery_password'
    post 'recovery_password', to: 'recovery_password#create'
  end
  get '404', to: 'errors#not_found'
  get '500', to: 'errors#server_error'
end
