Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :socialcompanies, path: 'sc', controllers: {registrations: 'socialcompanies/registrations'}
  devise_for :companies, path: 'company', controllers: {registrations: 'companies/registrations'}
  devise_for :donors, path: 'donor', controllers: {registrations: 'donors/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'session#login', as: 'login_path'
  post '/login/validate', to: 'session#validate', as: 'login_validation_path'
  delete '/logout', to: 'session#logout', as: 'logout_path'
  get '/register', to: 'session#registration_table', as: 'registration_table_path'
end
