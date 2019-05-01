Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :socialcompanies, path: 'socialcompanies', controllers: {sessions: 'socialcompanies/sessions', registrations: 'socialcompanies/registrations'}
  devise_for :companies, path: 'companies', controllers: {sessions: 'companies/sessions', registrations: 'companies/registrations'}
  devise_for :donors, path: 'donors', controllers: {sessions: 'donors/sessions', registrations: 'donors/registrations'}

  resources :companies do
    resources :benefits
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
