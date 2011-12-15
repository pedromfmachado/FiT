Fit::Application.routes.draw do


  get "reserve_aula/new"

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
  match '/users/:user_id/planos/mudarpassword' => 'users#edit_password', :as => "mudarpassword"
  match '/users/:user_id/planos/requisitarplano' => 'planos#requisitar_plano', :as => "requisitarplano"

  resources :users do
    resources :planos
    resources :reserva_aulas
  end

  resources :exercicios
  resources :sessions
  resources :notificacaos
  resources :reserva_aulas
  resources :pedido_planos

  resources :ginasios do
    resources :users
    resources :estudios
    resources :aulas do

      resources :reserva_aulas

    end
  end



  namespace :api do
    resources :users
    resources :planos
    resources :exercicios
    resources :sessions
    resources :notificacaos
    resources :ginasios
    resources :aulas
    resources :reserva_aulas
    match 'users/edit' => 'users#edit', :as => "users/edit"
  end

  
  root :to => "home#show"

end
