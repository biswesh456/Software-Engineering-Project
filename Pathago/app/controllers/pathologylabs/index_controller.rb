class Pathologylabs::IndexController < ApplicationController
  layout 'pathologylab_layout'
  def index
    @pathologylab = Pathologylab.find(params[:id])
  end

  def info
    @testid = params[:test_id]
    @pathologylabid = (Pathologylab.find_by(name: params[:pathologylab_name])).id
    @path_test = PathologyLabTest.find_by(test_id: @testid, pathologylab_id: @pathologylabid)

    render json: @path_test
  end
end
