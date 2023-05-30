class Clinic < ApplicationRecord
  has_many :departments
  has_many :patient_cards
  has_many :doctors
end
