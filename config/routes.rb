Fit::Application.routes.draw do

  root :to => "home#show"

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
  match 'cancelarmarcacao' => 'reserva_aulas#destroy', :as => "cancelarmarcacao"
  match 'efetuarmarcacao' => 'reserva_aulas#create', :as => "efetuarmarcacao"
  match '/ginasios/:ginasio_id/estatisticasmodalidade' => 'estatisticas#modalidade', :as => "estatisticasmodalidade"
  match '/ginasios/:ginasio_id/estatisticasmodalidadesemana' => 'estatisticas#modalidade_semana', :as => "estatisticasmodalidadesemana"
  match '/ginasios/:ginasio_id/estatisticasmodalidadeprofessor' => 'estatisticas#modalidade_professor', :as => "estatisticasmodalidadeprofessor"
  match '/ginasios/:ginasio_id/estatisticasaulasprofessor' => 'estatisticas#aulas_professor', :as => "estatisticasaulasprofessor"
  match '/ginasios/:ginasio_id/totalginasio' => 'estatisticas#total_ginasio', :as => "totalginasio"

  resources :users do
    resources :planos
    resources :reserva_aulas
    resources :pagamentos
    resources :alimentar_planos
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
    resources :estatisticas
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
    resources :alimentar_planos
    match 'desmarcar' => 'reserva_aulas#destroy', :as => "desmarcar"
    match 'users/edit' => 'users#edit', :as => "users/edit"
    match 'getinfo' => 'reserva_aulas#get_info', :as => "getinfo"
  end

  
  

end
