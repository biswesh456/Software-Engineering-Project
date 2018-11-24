# frozen_string_literal: true

class Pathologylabs::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    @tests_provided = current_pathologylab.tests
    @alltest = Test.all
    @tests = []
    @alltest.each do |t|
      unless @tests_provided.include?(t)
          @tests << t
      end
    end
    super
  end

  # PUT /resource
  def update
    tests_approved = []
    if (defined? params[:pathologylab][:tests_approved])
      (tests_approved << params[:pathologylab][:tests_approved]).flatten!
    end
    if (defined? params[:pathologylab][:tests_not_approved])
      (tests_approved << params[:pathologylab][:tests_not_approved]).flatten!
    end

    puts(tests_approved)
    # remove those tests which were previously present but now are not there
    @current_tests = PathologyLabTest.where(pathologylab_id:current_pathologylab.id)
    @current_tests.each do |ct|
      tname = Test.find(ct.test_id).name
      unless tests_approved.include?(tname)
          ct.destroy
      end
    end

    # create new tests which were not present before
    tests_approved.each do |ta|
      t = Test.find_by(name: ta)
      unless t.nil?
        new_path_test = PathologyLabTest.find_by(test_id: t.id, pathologylab_id:current_pathologylab.id)
        if new_path_test.blank?
          PathologyLabTest.create(test_id: t.id, pathologylab_id:current_pathologylab.id, total_seats:10, cost:1000)
        end
      end
    end
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:tests_approved])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:tests_approved])
   devise_parameter_sanitizer.permit(:account_update, keys: [:tests_approved])
 end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    pathologylab_current_appointment_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
