Rails.application.routes.draw do

  get 'vendas/generate', to: 'vendas#generate', as: 'pdf_generate'

  resources :items
  resources :vendas
  resources :atendentes
  resources :medicamentos
  resources :clientes
  devise_for :users
  resources :atendente




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"
end

