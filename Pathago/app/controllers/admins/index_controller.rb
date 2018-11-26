class Admins::IndexController < ApplicationController
  layout 'admin_layout'
  def index
    @tests = Test.all
    @admin = Admin.find(params[:id])
  end

  def add_test
    testname = params[:test_name]
    Test.create!(name: testname)
    redirect_to admin_index_path()
  end

  def remove_test
    t = Test.find(params[:test_id])
    t.destroy
    redirect_to admin_index_path()
  end
end
