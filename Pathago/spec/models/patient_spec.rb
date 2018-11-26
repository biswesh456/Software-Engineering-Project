require 'rails_helper'

RSpec.describe Patient, type: :model do
  context 'validation tests' do
    it 'ensures patient does not sign up without password' do
      patient = Patient.new(email: "abc@gmail.com", name: "abc", address: "Bangalore").save
      expect(patient).to eq(false)
    end

    it 'ensures patient sign up with password' do
      patient = Patient.new(email: "abc@gmail.com", name: "abc", address: "Bangalore", password: "123456").save
      expect(patient).to eq(true)
    end
  end
end
