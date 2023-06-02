class ClinicsController < ApplicationController
  before_action :set_clinic, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!
  ROWS_PER_PAGE = 10
  # GET /clinics or /clinics.json
  def index
    @current_page = params.fetch(:current_page, 0).to_i
    if params[:name].present?
      @clinics = ClinicSearchQuery.call(params).offset(@current_page * ROWS_PER_PAGE).limit(ROWS_PER_PAGE)
    else
      @clinics = ClinicsQuery.call(params).offset(@current_page * ROWS_PER_PAGE).limit(ROWS_PER_PAGE)
    end


  end

  # GET /clinics/1 or /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics or /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.avatar.attach(params[:clinic][:avatar])
    respond_to do |format|
      if @clinic.save
        format.html { redirect_to clinic_url(@clinic), notice: "Clinic was successfully created." }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1 or /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to clinic_url(@clinic), notice: "Clinic was successfully updated." }
        format.json { render :show, status: :ok, location: @clinic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1 or /clinics/1.json
  def destroy
    @clinic.destroy

    respond_to do |format|
      format.html { redirect_to clinics_url, notice: "Clinic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clinic_params
      params.require(:clinic).permit(:name, :owner, :year, :facility_type, :city, :mortality)
    end
end
