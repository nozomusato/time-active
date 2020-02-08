Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/edit_action/:id', to: 'users#edit_action', as: :edit_action
  patch '/users/:id/actives/:active_id/update_edit_action',  to: 'actives#update_edit_action', as: :update_edit_action

  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      
      get 'logs'
      get 'totalization'
      
      get 'actives/edit_one_month'
      patch 'actives/update_one_month'
      
    end
    resources :actives, only: :update
  end
  
end