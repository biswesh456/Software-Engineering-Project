class Admins::IndexController < ApplicationController
  def index
    @admin = Admin.find(params[:id])
  end
end
