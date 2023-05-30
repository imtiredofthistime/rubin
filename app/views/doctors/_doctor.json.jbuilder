json.extract! doctor, :id, :name, :surname, :department_id, :specialty=reference
json.url doctor_url(doctor, format: :json)
