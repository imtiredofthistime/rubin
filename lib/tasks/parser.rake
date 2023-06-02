require 'csv'

namespace :parse do
  desc 'Parse clinics CSV file'
  task clinic_csv: :environment do
    # а (type, city, RatingMortality)
    csv_text = File.read('storage/hospitals.csv')
    csv = CSV.parse(csv_text, headers: true)

    threads = []
    mutex = Mutex.new

    csv.each_slice(100) do |rows|
      threads << Thread.new do
        rows.each do |row|
          clinic = Clinic.new
          clinic.name = row['Facility.Name']
          clinic.address = row['Facility.City']
          clinic.facility_type = row['Facility.Type']
          clinic.city = row['Facility.City']
          clinic.mortality = row['Rating.Mortality']
          mutex.synchronize { clinic.save }
        end
      end
    end

    threads.each(&:join)
  end
end