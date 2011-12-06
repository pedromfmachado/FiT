Fit::Application.routes.draw do
  
  

  get "aulas/new"

  get "aulas/index"

  resources :tipo_aulas

  get "cidade/index"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "perfil/:id" => "users#show", :as => "perfil"

  match 'promote' => 'users#promote', :as => "promote"
  match 'demote' => 'users#demote', :as => "demote"
  match 'ginasiosperto' => 'ginasios#pertocidade', :as => "ginasiosperto"
  
  
  resources :users do
    resources :planos
  end
  resources :exercicios
  resources :sessions
  resources :notificacaos
  resources :ginasios do
    resources :users
    resources :estudios
    resources :aulas
  end


  namespace :api do
    resources :users
    resources :planos
    resources :exercicios
    resources :sessions
    resources :notificacaos
    resources :ginasios
    match 'users/edit' => 'users#edit', :as => "users/edit"
  end

  
  root :to => "home#show"

end
