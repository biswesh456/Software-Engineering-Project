class Test < ApplicationRecord
  has_many :pathology_lab_tests, dependent: :destroy
end
