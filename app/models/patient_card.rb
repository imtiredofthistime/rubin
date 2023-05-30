class PatientCard < ApplicationRecord
  has_one :patient
  belongs_to :clinic
end
