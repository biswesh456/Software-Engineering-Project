Rails.application.routes.draw do
  devise_for :patients, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'patients/registrations'}
  devise_scope :patient do
   get "signup", to: "devise/registrations#new"
   get "login", to: "devise/sessions#new"
   get "logout", to: "devise/sessions#destroy"
   get "/", to: "devise/sessions#new"
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/patient/:id/index/", to: "patients/index#index", as: "patient_index"
end
