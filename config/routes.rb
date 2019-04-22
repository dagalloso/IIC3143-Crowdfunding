Rails.application.routes.draw do
  devise_for :socialcompanies, path: 'sc', controllers: {sessions: 'socialcompanies/sessions'}
  devise_for :companies, path: 'company', controllers: {sessions: 'companies/sessions'}
  devise_for :donors, path: 'donor', controllers: {sessions: 'donors/sessions', registrations: 'donors/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
