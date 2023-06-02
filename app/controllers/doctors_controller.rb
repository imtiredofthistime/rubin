class DoctorsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_doctor, only: %i[ show edit update destroy ]
  ROWS_PER_PAGE = 10
  # GET /doctors or /doctors.json
  def index
    @page = params.fetch(:page, 0).to_i
    @doctors = Doctor.offset(@page*ROWS_PER_PAGE).limit(ROWS_PER_PAGE)
  end

  # GET /doctors/1 or /doctors/1.json
  def show

  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      # check if id is number
      # if not, then search by name
      # if not, then search by surname
      id = params[:id]
      if id.is_a? Numeric
        @doctor = Doctor.find(params[:id])
      else
        surname_and_name = params[:id].sub('space', ' ').split('-')
        @doctor = Doctor.where(surname: surname_and_name[0], name: surname_and_name[1]).first
      end
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name, :surname, :department_id, :specialty_id)
    end
end
