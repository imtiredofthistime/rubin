Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :doctor_patients
  devise_for :users
  # get 'users/:id' => 'users#show', as: :user
  resources :patients
  resources :patient_cards
  resources :specialties
  resources :doctors
  resources :departments
  resources :clinics
  resources :clinics do
    collection do
      get '/searchByNames', to: 'clinics#searchByNames'
    end
  end
  resources :patients do
    collection do
      get '/searchByNames', to: 'patients#searchByNames'
    end
  end

  get '/download' =>'downloader#download'
  get '/downloadAll/:id' => 'downloader#downloadAll', as: 'downloadAll'
  get '/downloadUsers' =>'downloader#downloadUsers'
  get '/downloadCsv' =>'downloader#download_csv'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
