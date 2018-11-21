class Pathologylabs::IndexController < ApplicationController
  layout 'pathologylab_layout'
  def index
    @pathologylab = Pathologylab.find(params[:id])
  end

  def profile
    @pathologylab = Pathologylab.find(params[:id])
    tests_provided = PathologyLabTest.where(pathologylab_id: @pathologylab.id)
    @test = @pathologylab.tests
  end

  def info
    @testid = params[:test_id]
    @pathologylab = (Pathologylab.find_by(name: params[:pathologylab_name]))
    @path_test = PathologyLabTest.find_by(test_id: @testid, pathologylab_id: @pathologylab.id)

    render json: {path_test: @path_test, pathlab: @pathologylab}
  end
end
