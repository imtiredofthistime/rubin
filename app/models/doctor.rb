class Doctor < ApplicationRecord
  belongs_to :department
  has_one :specialty, foreign_key: "specialty_id"
  has_many :patients, through: :doctor_patients
end
