class ClinicSearchQuery
  def self.call(params)
    clinics = Clinic.all
    clinics = clinics.where("name LIKE ?", "%#{params[:name]}%")
                     .or(Clinic.all.where(name: params[:name])) if params[:name].present?
    clinics.order(id: :desc)
  end
end