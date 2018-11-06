class PathologyLabTest < ApplicationRecord
  has_many :appointments
  belongs_to :pathologylab
  belongs_to :test
end
