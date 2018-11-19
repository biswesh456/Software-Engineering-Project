class PathologyLabTest < ApplicationRecord
  has_many :appointments
  has_many :test_path_times
  belongs_to :pathologylab
  belongs_to :test
end
