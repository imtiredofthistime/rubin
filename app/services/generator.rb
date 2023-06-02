# frozen_string_literal: true
require 'csv'

class Generator
  SEPARATOR_BETWEEN_VALUES = '; '.freeze
  SEPARATOR_BETWEEN_USERS = ', '.freeze

  def self.csv(clinics = Clinic.all)

    CSV.generate(headers: true, col_sep: SEPARATOR_BETWEEN_VALUES) do |csv|
      csv << %w[name owner street_address users]
      clinics.each do |clinic|
        patients = []
        patients = PatientCard.joins(:patient, :clinic).where("clinics.id = #{clinic.id}").pluck("patients.surname", "patients.name")
        if patients != nil
          patients = patients.map { |inner_array| inner_array.join(' ') }

        else
          patients = 'No patients'
        end

        csv << [clinic.name, clinic.owner, clinic.city, patients.join(SEPARATOR_BETWEEN_USERS)]
      end
    end

  end

  def self.pdf_clinics_all(clinics = Clinic.all)
    Prawn::Document.new do
      clinics.each do |clinic|
        text "--------------------------"
        text "\nName: #{clinic.name}"
        text "\nAddress: #{clinic.city}"
        image "storage/1.jpg", :width => 200, :height => 200
        text "\nPatients:\n"
        patients = PatientCard.joins(:patient, :clinic).where("clinics.id = #{clinic.id}").pluck("patients.surname", "patients.name")
        if patients != nil
          patients = patients.map { |inner_array| inner_array.join(' ') }
        else
          patients = 'No patients'
        end
        text patients.join(SEPARATOR_BETWEEN_USERS)
      end
    end.render
  end

  def self.download_clinic_id(clinic)
    #   <%= link_to "Download PDF", downloadAll_path(id: @clinic.id) %>
    Prawn::Document.new do
      text "--------------------------"
      text "\nName: #{clinic.name}"
      text "\nAddress: #{clinic.city}"
      image "storage/1.jpg", :width => 200, :height => 200
      text "\nPatients:\n"
      patients = PatientCard.joins(:patient, :clinic).where("clinics.id = #{clinic.id}").pluck("patients.surname", "patients.name")
      if patients != nil
        patients = patients.map { |inner_array| inner_array.join(' ') }
      else
        patients = 'No patients'
      end
      text patients.join(SEPARATOR_BETWEEN_USERS)
    end.render
  end

  def self.download_users(users = User.all)
    Prawn::Document.new do
      emails = ActiveRecord::Base.connection.execute("SELECT email FROM users").pluck("email")
      emails.each do |email|
        text "________________________"
        text "\nEmail: #{email}", :color => "aa0000"
      end
    end.render
  end
end