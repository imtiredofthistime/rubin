require "application_system_test_case"

class DoctorPatientsTest < ApplicationSystemTestCase
  setup do
    @doctor_patient = doctor_patients(:one)
  end

  test "visiting the index" do
    visit doctor_patients_url
    assert_selector "h1", text: "Doctor patients"
  end

  test "should create doctor patient" do
    visit doctor_patients_url
    click_on "New doctor patient"

    fill_in "Doctor", with: @doctor_patient.doctor_id
    fill_in "Patient", with: @doctor_patient.patient_id
    click_on "Create Doctor patient"

    assert_text "Doctor patient was successfully created"
    click_on "Back"
  end

  test "should update Doctor patient" do
    visit doctor_patient_url(@doctor_patient)
    click_on "Edit this doctor patient", match: :first

    fill_in "Doctor", with: @doctor_patient.doctor_id
    fill_in "Patient", with: @doctor_patient.patient_id
    click_on "Update Doctor patient"

    assert_text "Doctor patient was successfully updated"
    click_on "Back"
  end

  test "should destroy Doctor patient" do
    visit doctor_patient_url(@doctor_patient)
    click_on "Destroy this doctor patient", match: :first

    assert_text "Doctor patient was successfully destroyed"
  end
end
