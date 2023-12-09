Rails.application.routes.draw do
  mount_devise_token_auth_for 'Host', at: 'api/v1/hosts/auth', controllers: {
    registrations: 'api/v1/hosts/auth/registrations',
    confirmations: 'api/v1/hosts/auth/confirmations',
    sessions: 'api/v1/hosts/auth/sessions'
  }
  namespace :api do
    namespace :v1 do
      resources :hosts, only: [:index], controller: 'hosts/users'
    end
  end
end
