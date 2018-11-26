require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe Patients::IndexController, type: :controller do
  context 'Get #index' do
    it 'returns a success response' do
      patient = Patient.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      get :index, params: { id: patient.id }
      expect(response).to be_success
    end
  end

  context 'Get #profile' do
    it 'returns a success response' do
      patient = Patient.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      get :profile, params: { id: patient.id }
      expect(response).to be_success
    end
  end

  context 'Get #show' do
    it 'returns a success response' do
      patient = Patient.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      controller.stub(:current_patient).and_return(patient)

      pathologylab = Pathologylab.create!(email: "abc@gmail.com", name: "abc", address: "Bangalore", password: "qwertyu")
      tst = Test.create!(name: "Test1")
      path_test = PathologyLabTest.create!(pathologylab_id: pathologylab.id, test_id: tst.id)
      appointment = Appointment.create!(status: "Pending", patient_id: patient.id, pathology_lab_test_id: path_test.id)

      get :show, params: { id: patient.id }
      expect(response).to be_success
    end
  end

  context 'Get #book_appointment' do
    it 'returns a success response' do
      patient = Patient.create!(email: "first@gmail.com", name: "first", address: "Bangalore", password: "123456")
      controller.stub(:current_patient).and_return(patient)

      pathologylab = Pathologylab.create!(email: "abc@gmail.com", name: "abc", address: "Bangalore", password: "qwertyu")
      tst = Test.create!(name: "Test1")
      path_test = PathologyLabTest.create!(pathologylab_id: pathologylab.id, test_id: tst.id)

      get :book_appointment, params: { path_test_id: path_test.id, id: patient.id}
      expect(response).to be_success
    end
  end
end
