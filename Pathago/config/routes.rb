Rails.application.routes.draw do
  get "/", to: "index#index"
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'admins/registrations', sessions: 'admins/sessions'}
  devise_scope :admin do
   get "signup", to: "admins/registrations#new"
   get "login", to: "admins/sessions#new"
   get "logout", to: "admins/sessions#destroy"
  end
  devise_for :patients, path: 'patient', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'patients/registrations', sessions: 'patients/sessions', passwords: 'patients/passwords'}
  devise_scope :patient do
   get "signup", to: "patients/registrations#new"
   get "login", to: "patients/sessions#new"
   get "logout", to: "patients/sessions#destroy"
  end
  devise_for :pathologylabs, path: 'pathologylab', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }, controllers: {registrations: 'pathologylabs/registrations', sessions: 'pathologylabs/sessions', passwords: 'pathologylabs/passwords'}
  devise_scope :pathologylab do
   get "signup", to: "pathologylabs/registrations#new"
   get "login", to: "pathologylabs/sessions#new"
   get "logout", to: "pathologylabs/sessions#destroy"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/patient/:id/home/", to: "patients/index#index", as: "patient_index"
  get "/patient/:id/profile/", to: "patients/index#profile", as: "patient_profile"
  get "/pathologylab/:id/index/", to: "pathologylabs/index#index", as: "pathologylab_index"
  get "/admin/:id/index/", to: "admins/index#index", as: "admin_index"
end
