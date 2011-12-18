Fit::Application.routes.draw do


  get "pagamento/index"

  get "pagamento/confirmar"

  

  get "reserve_aula/new"

  get "aulas/new"

  get "aulas/index"

  

  get "cidade/index"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "perfil/:id" => "users#show", :as => "perfil"

  match 'promote' => 'users#promote', :as => "promote"
  match 'demote' => 'users#demote', :as => "demote"
  match 'ginasiosperto' => 'ginasios#pertocidade', :as => "ginasiosperto"
  match '/users/:id/mudarpassword' => 'users#edit_password', :as => "mudarpassword"
  match '/users/:user_id/planos/requisitarplano' => 'planos#requisitar_plano', :as => "requisitarplano"
  match 'apagarpedido' => 'pedido_planos#destroy', :as => "apagarpedido"
  match 'confirmarpagamento' => 'pagamentos#confirmar', :as => "confirmarpagamento"
  match 'cancelarpagamento' => 'pagamentos#cancelar', :as => "cancelarpagamento"

  resources :users do
    resources :planos
    resources :reserva_aulas
  end

  resources :tipo_aulas
  resources :exercicios
  resources :sessions
  resources :notificacaos
  resources :reserva_aulas
  resources :pedido_planos
  resources :modalidade_pagamentos
  resources :pagamentos

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
    resources :pedido_planos
    resources :feedbacks
    resources :pagamentos
    match 'desmarcar' => 'reserva_aulas#destroy', :as => "desmarcar"
    match 'users/edit' => 'users#edit', :as => "users/edit"
    match 'getinfo' => 'reserva_aulas#get_info', :as => "getinfo"
  end

  
  root :to => "home#show"

end
