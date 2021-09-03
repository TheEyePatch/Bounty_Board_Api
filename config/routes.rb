Rails.application.routes.draw do

  namespace :v1 do
    resources :bounties do
        member do
            patch :dibs
            patch :approve
        end
    end
    resources :comments, only: %i[index create update destroy]
    namespace :users do 
      devise_for :users, controllers: { registrations: 'v1/users/registrations', sessions: 'v1/users/sessions' }
      get 'users/pending_users'
      post 'users/:id/approve_user', to: 'users#approve_user'
    end
    namespace :admins do
      resources :admins
    end
    resources :projects
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
