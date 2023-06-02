class Patient < ApplicationRecord
  has_one :patient_card
  has_many :doctors, through: :doctor_patients
end
