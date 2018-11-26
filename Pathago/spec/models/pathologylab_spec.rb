require 'rails_helper'

RSpec.describe Pathologylab, type: :model do
  context 'validation tests' do
    it 'ensures pathologylab does not sign up without password' do
      pathologylab = Pathologylab.new(email: "abc@gmail.com", name: "abc", address: "Bangalore").save
      expect(pathologylab).to eq(false)
    end

    it 'ensures pathologylab sign up with password' do
      pathologylab = Pathologylab.new(email: "abc@gmail.com", name: "abc", address: "Bangalore", password: "123456").save
      expect(pathologylab).to eq(true)
    end
  end
end
