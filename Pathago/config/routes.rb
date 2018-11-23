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
  get "/patient/:id/new_appointment/", to: "patients/index#new_appointment", as: "patient_new_appointment"
  get "/pathologylab/:id/index/", to: "pathologylabs/index#index", as: "pathologylab_index"
  get "/admin/:id/index/", to: "admins/index#index", as: "admin_index"
  get "/pathologylab_test/info", to: "pathologylabs/index#info", as: "pathologylab_test_info"
  get "/patient/:id/appointment/book", to: "patients/index#book_appointment", as: "book_appointment"
  get "/patient/:id/show", to: "patients/index#show" , as:"patient_show_appointment"
  get "/appointment/time_info", to: "appointments#time_info", as: "get_time_info"
  get "/pathologylab/:id/profile/", to: "pathologylabs/index#profile", as: "pathologylab_profile"
  get "patient/:id/appointment/pay", to: "patients/index#pay", as: "pay_for_appointment"
  get "patient/:id/appointment/confirmation", to: "patients/index#confirmation", as: "appointment_confirmation"
  get "/pathologylab/:id/current_appointment", to: "pathologylabs/index#current_appointment" , as:"pathologylab_current_appointment"
  get "/pathologylab/:id/history", to: "pathologylabs/index#history" , as:"pathologylab_history"
  get "/pathologylab/:id/edit_appointment", to: "pathologylabs/index#edit_appointment" , as:"pathologylab_edit_appointment"
  get "/pathologylab/:id/edit_appointment_after", to: "pathologylabs/index#edit_appointment_after" , as:"pathologylab_edit_appointment_after"
  get "/pathologylab/:id/update_test", to: "pathologylabs/index#update_test" , as:"pathologylab_update_test"
  get "/pathologylab/:id/get_fixed_time", to: "pathologylabs/index#get_fixed_time", as: "get_fixed_time"
  get "/pathologylab/:id/delete_fixed_time", to: "pathologylabs/index#delete_fixed_time", as: "delete_fixed_time"
  get "/pathologylab/:id/add_fixed_time", to: "pathologylabs/index#add_fixed_time", as: "add_fixed_time"
end
