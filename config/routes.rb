Rails.application.routes.draw do

  namespace :v1 do
    namespace :users do 
      devise_for :bounty_hunters, controllers: { registrations: 'v1/users/registrations', sessions: 'v1/users/sessions' }
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
