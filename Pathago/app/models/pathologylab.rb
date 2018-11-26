class Pathologylab < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pathology_lab_tests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def tests
    tests_provided = PathologyLabTest.where(pathologylab_id: self.id)
    @test = []
    tests_provided.each do |t|
      ts = Test.find(t.test_id)
      unless @test.include?(ts)
          @test << ts
      end
    end
    return @test
  end

  def tests_approved
  end

  def tests_not_approved
  end
end
