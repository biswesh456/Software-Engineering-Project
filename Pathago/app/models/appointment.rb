class Appointment < ApplicationRecord
  belongs_to :pathology_lab_test
  belongs_to :patient
  mount_uploader :attachment, AttachmentUploader
end
