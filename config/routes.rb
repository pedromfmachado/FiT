Fit::Application.routes.draw do
  resources :notificacaos

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "perfil/:id" => "users#show", :as => "perfil"

  match 'promote' => 'users#promote', :as => "promote"
  match 'demote' => 'users#demote', :as => "demote"
  
  resources :users do
    resources :planos
  end
  resources :exercicios
  resources :sessions
  resources :notificacaos

  namespace :api do
    resources :users
    resources :planos
    resources :exercicios
    resources :sessions
    resources :notificacaos
  end

  #rotas da api
  
  root :to => "home#show"

end
