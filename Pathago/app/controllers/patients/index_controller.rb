class Patients::IndexController < ApplicationController
  def index
    @patient = Patient.find(params[:id])
  end
end
