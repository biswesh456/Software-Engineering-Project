class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if current_patient
      patient_index_path(resource_or_scope)
    elsif current_pathologylab
      pathologylab_index_path(resource_or_scope)
    end
  end
end
