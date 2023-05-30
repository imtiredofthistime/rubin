class Doctor < ApplicationRecord
  belongs_to :department
  has_one :specialty, foreign_key: "specialty_id"
end
