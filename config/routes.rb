Rails.application.routes.draw do
  devise_for :socialcompanies, path: 'sc'
  devise_for :companies, path: 'company'
  devise_for :donors, path: 'donor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
