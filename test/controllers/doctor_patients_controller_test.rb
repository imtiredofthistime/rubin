require "test_helper"

class DoctorPatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor_patient = doctor_patients(:one)
  end

  test "should get index" do
    get doctor_patients_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_patient_url
    assert_response :success
  end

  test "should create doctor_patient" do
    assert_difference("DoctorPatient.count") do
      post doctor_patients_url, params: { doctor_patient: { doctor_id: @doctor_patient.doctor_id, patient_id: @doctor_patient.patient_id } }
    end

    assert_redirected_to doctor_patient_url(DoctorPatient.last)
  end

  test "should show doctor_patient" do
    get doctor_patient_url(@doctor_patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_patient_url(@doctor_patient)
    assert_response :success
  end

  test "should update doctor_patient" do
    patch doctor_patient_url(@doctor_patient), params: { doctor_patient: { doctor_id: @doctor_patient.doctor_id, patient_id: @doctor_patient.patient_id } }
    assert_redirected_to doctor_patient_url(@doctor_patient)
  end

  test "should destroy doctor_patient" do
    assert_difference("DoctorPatient.count", -1) do
      delete doctor_patient_url(@doctor_patient)
    end

    assert_redirected_to doctor_patients_url
  end
end
