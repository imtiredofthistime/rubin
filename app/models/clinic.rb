class Clinic < ApplicationRecord
  has_many :departments
  has_many :doctor_patients
  has_many :doctors
  has_one_attached :avatar

end
