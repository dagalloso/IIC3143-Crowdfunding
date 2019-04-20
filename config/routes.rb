Rails.application.routes.draw do
  devise_for :socialcompanies, path: 'sc', controllers: {sessions: 'sc/sessions'}
  devise_for :companies, path: 'company', controllers: {sessions: 'company/sessions'}
  devise_for :donors, path: 'donor', controllers: {sessions: 'donor/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
