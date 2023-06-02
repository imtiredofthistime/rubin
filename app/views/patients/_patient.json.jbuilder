json.extract! patient, :id, :name, :email, :surname, :age
json.url patient_url(patient, format: :json)
