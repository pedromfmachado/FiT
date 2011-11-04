Fit::Application.routes.draw do
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

  namespace :api do
    resources :users do
      resources :planos
    end
    resources :exercicios
    resources :sessions
  end

  #rotas da api
  
  root :to => "sessions#new"

end
