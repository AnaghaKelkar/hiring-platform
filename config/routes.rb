Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'connect/contact_us'

  get 'dashboard/admin'
  get 'dashboard/applicant'

  resources :jobs do
    member do
      get :applicants
      get :status
    end
  end

  resources :applicants do
    collection do
      get :jobs
      get :applied_jobs
    end
    member do
      get :apply
      post :submit
    end
  end

  resources :admins

  resources :analytics do
    collection do
      get :summary
    end
  end
end
