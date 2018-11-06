class Pathologylab < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pathogy_lab_tests
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
