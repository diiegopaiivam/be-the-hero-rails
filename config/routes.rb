Rails.application.routes.draw do
  devise_for :ongs
  namespace :api do
    namespace :v1 do
      resources :ongs
      resources :incidents
    end
  end

  # routes for aplication in production
  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :contacts
  #     end
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
