class PatientSearchQuery
  def self.call(params)
    patients = Patient.all
    if params[:name].to_i != 0
      return Patient.all.where(age: params[:name])
    else
      patients = patients.where(name: params[:name])
                         .or(Patient.all.where(surname: params[:name]))
                         .or(Patient.all.where(name: params[:name].split(' ')[0], surname: params[:name].split(' ')[1]))
                         .or(Patient.all.where(name: params[:name].split(' ')[1], surname: params[:name].split(' ')[0])) if params[:name].present?
      patients.order(id: :desc)
    end
  end
end