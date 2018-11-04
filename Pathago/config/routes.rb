Rails.application.routes.draw do
  devise_for :patients, path: 'patient', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'patients/registrations'}
  devise_scope :patient do
   get "signup", to: "patients/registrations#new"
   get "login", to: "patients/sessions#new"
   get "logout", to: "patients/sessions#destroy"
   get "/", to: "patients/sessions#new"
  end
  devise_for :pathologylabs, path: 'pathologylab', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'pathologylabs/registrations'}
  devise_scope :pathologylab do
   get "signup", to: "pathologylabs/registrations#new"
   get "login", to: "pathologylabs/sessions#new"
   get "logout", to: "pathologylabs/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/patient/:id/index/", to: "patients/index#index", as: "patient_index"
  get "/pathologylab/:id/index/", to: "pathologylabs/index#index", as: "pathologylab_index"
end
