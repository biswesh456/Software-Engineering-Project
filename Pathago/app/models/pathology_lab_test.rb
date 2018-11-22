class PathologyLabTest < ApplicationRecord
  has_many :appointments, dependent: :delete_all
  has_many :test_path_times, dependent: :delete_all
  has_many :path_test_fixed_times, dependent: :delete_all
  belongs_to :pathologylab
  belongs_to :test
end
