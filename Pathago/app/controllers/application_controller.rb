class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if current_patient
      patient_show_appointment_path(resource_or_scope)
    elsif current_pathologylab
      pathologylab_current_appointment_path(resource_or_scope)
    elsif current_admin
      admin_index_path(resource_or_scope)
    end
  end
end
