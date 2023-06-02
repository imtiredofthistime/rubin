class DoctorPatientsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_doctor_patient, only: %i[ show edit update destroy ]
  ROWS_PER_PAGE = 10

  # GET /doctor_patients or /doctor_patients.json
  def index
    @page = params.fetch(:page, 0).to_i
    @doctor_patients = DoctorPatient.offset(@page*ROWS_PER_PAGE).limit(ROWS_PER_PAGE)
  end

  # GET /doctor_patients/1 or /doctor_patients/1.json
  def show
  end

  # GET /doctor_patients/new
  def new
    @doctor_patient = DoctorPatient.new
  end

  # GET /doctor_patients/1/edit
  def edit
  end

  # POST /doctor_patients or /doctor_patients.json
  def create
    @doctor_patient = DoctorPatient.new(doctor_patient_params)

    respond_to do |format|
      if @doctor_patient.save
        format.html { redirect_to doctor_patient_url(@doctor_patient), notice: "Doctor patient was successfully created." }
        format.json { render :show, status: :created, location: @doctor_patient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_patients/1 or /doctor_patients/1.json
  def update
    respond_to do |format|
      if @doctor_patient.update(doctor_patient_params)
        format.html { redirect_to doctor_patient_url(@doctor_patient), notice: "Doctor patient was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor_patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_patients/1 or /doctor_patients/1.json
  def destroy
    @doctor_patient.destroy

    respond_to do |format|
      format.html { redirect_to doctor_patients_url, notice: "Doctor patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_patient
      @doctor_patient = DoctorPatient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_patient_params
      params.require(:doctor_patient).permit(:doctor_id, :patient_id)
    end
end
