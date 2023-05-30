Rails.application.routes.draw do
  resources :patients
  resources :patient_cards
  resources :specialties
  resources :doctors
  resources :departments
  resources :clinics
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
