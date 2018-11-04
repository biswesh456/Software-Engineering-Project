class Pathologylabs::IndexController < ApplicationController
  def index
    @pathologylab = Pathologylab.find(params[:id])
  end
end
