Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'connect/contact_us'

  get 'dashboard/admin'
  get 'dashboard/applicant'
end
