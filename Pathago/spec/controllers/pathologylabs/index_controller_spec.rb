require 'rails_helper'

RSpec.describe Pathologylabs::IndexController, type: :controller do
  context 'Get #index' do
    it 'returns a success response' do
      pathologylab = Pathologylab.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      get :index, params: { id: pathologylab.id }
      expect(response).to be_success
    end
  end

  context 'Get #profile' do
    it 'returns a success response' do
      pathologylab = Pathologylab.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      get :profile, params: { id: pathologylab.id }
      expect(response).to be_success
    end
  end

  context 'Get #current_appointment' do
    it 'returns a success response' do
      pathologylab = Pathologylab.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      controller.stub(:current_pathologylab).and_return(pathologylab)

      patient = Patient.create!(email: "abc@gmail.com", name: "abc", address: "Hyderabad", password: "qwertyu")
      tst = Test.create!(name: "Test1")
      path_test = PathologyLabTest.create!(pathologylab_id: pathologylab.id, test_id: tst.id)
      appointment = Appointment.create!(status: "Pending", patient_id: patient.id, pathology_lab_test_id: path_test.id)

      get :current_appointment, params: { id: pathologylab.id }
      expect(response).to be_success
    end
  end
end
